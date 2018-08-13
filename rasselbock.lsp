(in-package :rasselbock :use '(:lisp :sys))

(eval-when (compile load eval)
  (require 'parameters)
  (require 'inetdef)
  (require 'starlet)
  (require 'stardeffl)
  (require 'vms)
  (require 'dispatch))

(define-alien-structure sockchar
  (prot :unsigned-integer 0 2)
  (type :unsigned-integer 2 3)
  (af :unsigned-integer 3 4))

(define-alien-structure sockaddr-in
  (SIN$W_FAMILY :unsigned-integer 0 2 :default 0)
  (SIN$W_PORT :unsigned-integer 2 4 :default 0)
  (SIN$L_ADDR :unsigned-integer 4 8 :default 0)
  (SIN$T_ZERO :unsigned-integer 8 16 :default 0))

(define-external-routine (UCX$INET_ADDR
                             :file "UCX$IPC_SHR"
                             :result (:lisp-type integer
                                      :vax-type :unsigned-longword))
  (address-string :lisp-type string
                  :vax-type :asciz
                  :access :in))

(defstruct raw-request
  (lines (make-array +header-count+ :fill-pointer 0))
  (buffer "")
  completep)

(defun read-line* (stream)
  (let ((*standard-output* (make-string-output-stream))
        (chars-read 0))
    (loop
      (let ((char (read-char stream nil)))
        (if char
            (progn
              (incf chars-read)
              (case char
                (#\return)
                ((#\linefeed #\newline)
                 (return (values (get-output-stream-string *standard-output*)
                                 nil
                                 chars-read)))
                (otherwise (write-char char))))
            (return (values (unless (zerop chars-read)
                              (get-output-stream-string *standard-output*))
                            t
                            chars-read)))))))

(defun raw-request-add-buffer (raw-request new-buffer)
  (assert (not (raw-request-completep raw-request)))
  (let ((input-buffer (concatenate 'string
                                   (raw-request-buffer raw-request)
                                   new-buffer))
        (characters-consumed 0))
    (with-input-from-string (input input-buffer)
      (loop
        (multiple-value-bind (line missing-newline-p chars-read) (read-line* input)
          (incf characters-consumed chars-read)
          (when (equal line "")
            (setf (raw-request-completep raw-request) t
                  (raw-request-buffer raw-request) (subseq input-buffer characters-consumed))
            (return))
          (when (or (null line)
                    missing-newline-p)
            (unless (< (length line) +header-buffer-size+)
              (error "Maximum header length ~A exceeded by input"
                     +header-buffer-size+))
            (setf (raw-request-buffer raw-request) (or line ""))
            (return))
          ;; Support header continuations (now obsolete, but wth)
          (if (whitespacep (aref line 0))
              (if (zerop (length (raw-request-lines raw-request)))
                  (error "unsyntactic header (first lines starts with whitespace)")
                  ;; This is a continued header
                  (let ((last-index (1- (length (raw-request-lines raw-request)))))
                    (setf (aref (raw-request-lines raw-request) last-index)
                          (concatenate 'string
                                       (aref (raw-request-lines raw-request) last-index)
                                       " "
                                       (subseq line (position-if-not #'whitespacep line))))))
              ;; This is a new header
              (unless (vector-push line
                                   (raw-request-lines raw-request))
                (error "Too many header lines (max ~A)"
                       +header-count+))))))))

(defun parse-request-line (line)
  (let* ((uri-position (position #\space line))
         (http-version-position (and uri-position
                                     (position #\space line
                                               :start (1+ uri-position)))))
    (unless (and uri-position http-version-position)
      (error "unsyntactic request line ~S" line))
    (list :method (make-keyword (subseq line 0 uri-position))
          :uri (subseq line (1+ uri-position) http-version-position)
          :http-version (make-keyword (subseq line (1+ http-version-position))))))

(defun parse-header-line (line)
  (let* ((colon-position (position #\: line))
         (content-position (when colon-position
                             (position-if-not #'whitespacep line
                                              :start (1+ colon-position)))))
    (unless (and colon-position content-position)
      (error "unsyntactic header line ~S" line))
    (values (make-keyword (subseq line 0 colon-position))
            (subseq line content-position))))

(defstruct request method uri http-version header raw-request)

(defun parse-request-and-header (lines)
  (let ((i 1)
        header)
    (loop
      (when (= i (length lines))
        (return))
      (multiple-value-bind (key value)
                           (parse-header-line (aref lines i))
        (push value header)
        (push key header))
      (incf i))
    (apply #'make-request
           :header (nreverse header)
           (parse-request-line (aref lines 0)))))

(defmacro with-ucx-channel ((channel) &body body)
  `(let ((,channel 0))
     (unwind-protect
         (progn
           (c SYS$ASSIGN "UCX$DEVICE" ,channel nil nil)
           ,@body)
       (unless (zerop ,channel)
         (c SYS$DASSGN ,channel)))))

(defun setup-listen-socket (channel port)
  ;; Open TCP socket
  ($QIOW/check-iosb channel IO$_SETMODE
                    :p1 (make-sockchar :allocation :static
                                       :prot TCPIP$C_TCP
                                       :type TCPIP$C_STREAM
                                       :af TCPIP$C_AF_INET))

  ;; Enable reuseaddr option
  (let* ((optval (make-long :allocation :static
                            :value 1))
         (reuseaddr (make-itemlst-2 :allocation :static
                                    :type TCPIP$C_REUSEADDR
                                    :length (alien-structure-length optval)
                                    :address optval)))
    ($QIOW/check-iosb channel IO$_SETMODE
                      :p5 (make-itemlst-2 :allocation :static
                                          :type TCPIP$C_SOCKOPT
                                          :length (alien-structure-length reuseaddr)
                                          :address reuseaddr)))

  ;; Set local address
  (let ((sockaddr-in (make-sockaddr-in :allocation :static
                                       :SIN$W_FAMILY INET$C_AF_INET
                                       :SIN$W_PORT (swab port)
                                       :SIN$L_ADDR 0)))
    ($QIOW/check-iosb channel IO$_SETMODE
                      :p3 (make-itemlst-2 :allocation :static
                                          :length (alien-structure-length sockaddr-in)
                                          :address sockaddr-in)))

  ;; Listen for incoming connections
  ($QIOW/check-iosb channel IO$_SETMODE
                    :p4 +server-backlog+))

(defvar *last-raw-request* nil)

(defun read-request (channel)
  (let ((raw-request (make-raw-request))
        (buffer (make-string-buffer :allocation :static)))
    (loop
      ($QIOW/check-iosb channel IO$_READVBLK
                        :p1 buffer
                        :p2 +buffer-size+)
      (raw-request-add-buffer raw-request (string-buffer-string buffer))
      (setf *last-raw-request* raw-request)
      (when (raw-request-completep raw-request)
        (return)))
    (parse-request-and-header (raw-request-lines raw-request))))

(defun write-string-to-socket (channel string)
  ($QIOW/check-iosb channel IO$_WRITEVBLK
                    :p1 (make-string-buffer :allocation :static
                                            :string string)
                    :p2 (length string)))

(defun write-response-status-and-header (channel response)
  ;; Send response status and header
  (with-output-to-string (*standard-output*)
    (format t "~A ~D ~A~C~C"
            *response-http-version*
            (response-status response)
            (response-status-string response)
            #\Return #\Linefeed)
    (format t "Server: ~A~C~C"
            *server-string* #\Return #\Linefeed)
    (doplist (key value (response-header response))
      (format t "~:(~A~): ~A~C~C"
              key value #\Return #\Linefeed))
    (format t "~C~C" #\Return #\Linefeed)
    (finish-output *standard-output*)
    (write-string-to-socket channel
                            (get-output-stream-string *standard-output*))))

(defun write-response-body (channel response)
  (funcall (response-write-body response) channel (response-body response)))

(defun handle-error-during-request (function-name
                                       error-signalling-function
                                       format &rest args)
  (format *error-output* "~&Error processing client request: ~?~%"
          format args)
  (throw 'error nil))

(defun process-requests (channel client-sockaddr-in)
  (catch 'error
    (let* ((*universal-error-handler* #'handle-error-during-request)
           (request (read-request channel))
           (response (dispatch-request request)))
      (format t "~&~A ~A ~A ~A~%"
              (format-ip-address (sockaddr-in-SIN$L_ADDR client-sockaddr-in))
              (request-method request)
              (request-uri request)
              (response-status response))
      (write-response-status-and-header channel response)
      (write-response-body channel response))))

(defun http-server (&key (port 2002))
  (with-ucx-channel (server-channel)
    (setup-listen-socket server-channel port)
    (loop
      ;; Accept one connection
      (let* ((client-channel (make-short :allocation :static))
             (client-sockaddr-in (make-sockaddr-in :allocation :static))
             (client-address-length (make-short :allocation :static)))
        (with-ucx-channel (channel)
          (setf (short-value client-channel) channel)
          ($QIOW/check-iosb server-channel (logior IO$_ACCESS IO$M_ACCEPT)
                            :p3 (make-itemlst-3 :allocation :static
                                                :length (alien-structure-length client-sockaddr-in)
                                                :address client-sockaddr-in
                                                :retlen client-address-length)
                            :p4 client-channel)
          (process-requests channel client-sockaddr-in))))))

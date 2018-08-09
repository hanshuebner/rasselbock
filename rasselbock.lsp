(in-package :user)

(eval-when (compile load eval)
  (require 'INETDEF)
  (require 'STARLET)
  (require 'STARDEFQZ)
  (require 'STARDEFFL))

;; Size of I/O buffers to read and write TCP data
(eval-when (compile load eval)
  (defconstant +buffer-size+ 1024))

;; Maximum size of one HTTP header
(defconstant +header-buffer-size+ 16384)

;; Maximum number of HTTP headers
(defconstant +header-count+ 32)

;; Maximum number of pending incoming connections
(defconstant +server-backlog+ 5)

;; HTTP version to report in responses
(defconstant +response-http-version+ "HTTP/1.0")

(define-alien-structure iosb
  (status :unsigned-integer 0 2)
  (bytecnt :unsigned-integer 2 4)
  (details :pointer 4 8))

(define-alien-structure sockchar
  (prot :unsigned-integer 0 2)
  (type :unsigned-integer 2 3)
  (af :unsigned-integer 3 4))

(define-alien-structure itemlst-2
  (length :unsigned-integer 0 2)
  (type :unsigned-integer 2 4 :default 0)
  (address :pointer 4 8))

(define-alien-structure itemlst-3
  (length :unsigned-integer 0 2)
  (type :unsigned-integer 2 4 :default 0)
  (address :pointer 4 8)
  (retlen :pointer 8 12 :default 0))

(define-alien-structure sockaddr-in
  (SIN$W_FAMILY :unsigned-integer 0 2 :default 0)
  (SIN$W_PORT :unsigned-integer 2 4 :default 0)
  (SIN$L_ADDR :unsigned-integer 4 8 :default 0)
  (SIN$T_ZERO :unsigned-integer 8 16 :default 0))

(define-alien-structure string-buffer
  (string :asciz 0 #.+buffer-size+))

(define-alien-structure short
  (value :unsigned-integer 0 2 :default 0))

(define-alien-structure long
  (value :unsigned-integer 0 4 :default 0))

(define-external-routine (UCX$INET_ADDR
                             :file "UCX$IPC_SHR"
                             :result (:lisp-type integer
                                      :vax-type :unsigned-longword))
  (address-string :lisp-type string
                  :vax-type :asciz
                  :access :in))

(defmacro doplist ((key value plist) &body body)
  (let ((current (gensym)))
    `(let ((,current ,plist))
       (loop
         (if ,current
             (let ((,key (first ,current))
                   (,value (second ,current)))
               ,@body
               (setf ,current (cddr ,current)))
             (return))))))

(defun swab (in)
  (let ((out 0))
    (setf (ldb (byte 8 0) out) (ldb (byte 8 8) in)
          (ldb (byte 8 8) out) (ldb (byte 8 0) in))
    out))

(defun format-ip-address (address)
  (format nil "~D.~D.~D.~D"
          (ldb (byte 8 0) address)
          (ldb (byte 8 8) address)
          (ldb (byte 8 16) address)
          (ldb (byte 8 24) address)))

(defun successp (status)
  (plusp (logand status sts$m_success)))

(defun get-message (status)
  (let* ((string-length 1024)
         (buffer (make-string string-length))
         (status (call-out SYS$GETMSG
                           status
                           string-length
                           buffer
                           15 ; macro default
                           nil)))
    (if (successp status)
        buffer
        (format nil "could not find message for status 0x~X" status))))

(defun check-status (status caller)
  (unless (successp status)
    (error (format nil "Error in ~A:~%~A"
                   caller
                   (get-message status)))))

(defmacro c (&rest call)
  (let ((status (gensym)))
    `(let ((,status (call-out ,@call)))
       (check-status ,status ',call))))

(defmacro $QIOW (chan func iosb
                      &key
                      (efn 0)
                      astadr
                      astprm
                      p1 p2 p3 p4 p5 p6)
  `(c SYS$QIOW
      ,efn ,chan ,func ,iosb ,astadr ,astprm
      ,p1 ,p2 ,p3 ,p4 ,p5 ,p6))

(defmacro $QIOW/check-iosb (chan func
                                 &key
                                 (efn 0)
                                 astadr
                                 astprm
                                 p1 p2 p3 p4 p5 p6)
  (let ((iosb (gensym)))
    `(let ((,iosb (make-iosb :allocation :static)))
       (c SYS$QIOW
          ,efn ,chan ,func ,iosb ,astadr ,astprm
          ,p1 ,p2 ,p3 ,p4 ,p5 ,p6)
       (check-status (iosb-status ,iosb) ',func))))

(defun quote-string (string)
  (with-output-to-string (*standard-output*)
    (let (in-printable-p)
      (dotimes (i (length string))
        (let ((char (aref string i)))
          (if (graphic-char-p char)
              (progn
                (unless in-printable-p
                  (setf in-printable-p t)
                  (unless (zerop i)
                    (write-char #\space))
                  (write-char #\"))
                (write-char char))
              (progn
                (when in-printable-p
                  (setf in-printable-p nil)
                  (write-char #\"))
                (unless (zerop i)
                  (write-char #\space))
                (format t "#\\~:(~A~)" (char-name char))))))
      (when in-printable-p
        (write-char #\")))))

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

(defun whitespacep (c)
  (or (eq c #\space)
      (eq c #\tab)
      (eq c #\linefeed)
      (eq c #\return)))

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

(defun make-keyword (string)
  (intern (string-upcase string) :keyword))

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

(defun tcp-test-client (&key (ip-address "172.16.101.128") (port 2002))
  (with-ucx-channel (channel)

    ;; Open TCP socket
    ($QIOW/check-iosb channel IO$_SETMODE
                      :p1 (make-sockchar :allocation :static
                                         :prot TCPIP$C_TCP
                                         :type TCPIP$C_STREAM
                                         :af TCPIP$C_AF_INET))

    ;; Establish connection
    (let* ((sockaddr-in (make-sockaddr-in :allocation :static
                                          :SIN$W_FAMILY INET$C_AF_INET
                                          :SIN$W_PORT (swab port)
                                          :SIN$L_ADDR (call-out UCX$INET_ADDR ip-address))))
      ($QIOW/check-iosb channel IO$_ACCESS
                        :p3 (make-itemlst-2 :allocation :static
                                            :length (alien-structure-length sockaddr-in)
                                            :address sockaddr-in)))

    ;; Send some data
    (let* ((message (format nil "Hello world!~C~C" #\Return #\Linefeed))
           (buffer (make-string-buffer :allocation :static
                                       :string message)))
      ($QIOW/check-iosb channel IO$_WRITEVBLK
                        :p1 buffer :p2 (length message)))

    ;; Receive some data
    (let* ((buffer (make-string-buffer :allocation :static))
           (iosb (make-iosb :allocation :static)))

      ($QIOW channel IO$_READVBLK iosb
             :p1 buffer
             :p2 +buffer-size+)
      (check-status (iosb-status iosb) 'IO$_READVBLK)
      (write-string (quote-string (string-buffer-string buffer)))
      (terpri))))

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

(defstruct response
  (status 200)
  (status-string "OK")
  (header `(:server "VAX LISP HTTP Server 0.0"))
  body)

(defun dispatch-request (request)
  (make-response :status 404
                 :status-string "Not found"
                 :body "The requested resource was not found"))

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
            +response-http-version+
            (response-status response)
            (response-status-string response)
            #\Return #\Linefeed)
    (doplist (key value (response-header response))
      (format t "~:(~A~): ~A~C~C"
              key value #\Return #\Linefeed))
    (format t "~C~C" #\Return #\Linefeed)
    (write-string-to-socket channel
                            (get-output-stream-string *standard-output*))))

(defun write-response-body (channel response)
  (etypecase (response-body response)
    (string 
        (write-string-to-socket channel
                                (response-body response)))))

(defun process-request (channel)
  (let* ((request (read-request channel))
         (response (dispatch-request request)))
    (write-response-status-and-header channel response)
    (write-response-body channel response)))

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
          (format t "~&connection established from ~A:~A~%"
                  (format-ip-address (sockaddr-in-SIN$L_ADDR client-sockaddr-in))
                  (swab (sockaddr-in-SIN$W_PORT client-sockaddr-in)))

          (process-request channel))))))

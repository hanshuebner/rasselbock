(in-package :rasselbock)

(provide 'files)

(eval-when (compile load eval)
  (require 'rmsdef)
  (require 'rmsusr)
  (require 'utils)
  (require 'response))

(defmacro with-file-information ((file &rest fields) &body body)
  (let ((keywords (mapcar #'make-keyword fields))
        (result (gensym)))
    `(let* ((,result (get-file-information ,file ,@keywords))
            ,@(mapcar #'(lambda (variable keyword)
                          (list variable `(getf ,result ,keyword)))
                      fields (mapcar #'make-keyword fields)))
       ,@body)))

(defparameter *content-types* (list :jpg "image/jpeg"
                                    :jpeg "image/jpeg"
                                    :html "text/html"
                                    :xml "text/xml"
                                    :js "text/javascript"))

(defun make-content-type-map ()
  (let ((map (make-hash-table)))
    (doplist (type content-type *content-types*)
      (setf (gethash type map) content-type))
    map))

(defparameter *content-type-map* (make-content-type-map))

(defstruct file pathname size textp content-type)

(defun file-information (pathname)
  "Return information about the given file in a file structure.  FILE-SIZE
is the size of the file in bytes.  PATHNAME is the pathname argument passed
to this function.  FILE-TEXTP has a true value if the file is a
text file, based on RMS attribute heuristics.  FILE-CONTENT-TYPE is the content
type to report to the client."
  ;; FIXME: file-size only works for fixed-block-size, non-indexed files
  (with-file-information (pathname organization record-format record-attributes
                                   block-size end-of-file-block first-free-byte)
    (when organization
      (let ((textp (and (= organization FAB$C_SEQ)
                        (or (= record-format FAB$C_VAR)
                            (= record-format FAB$C_VFC))
                        (not (zerop (logand record-attributes
                                            (logior FAB$M_CR FAB$M_PRN)))))))
        (make-file :pathname pathname
                   :size (+ (* block-size (1- end-of-file-block)) first-free-byte)
                   :textp textp
                   :content-type (or (gethash (make-keyword (pathname-type pathname))
                                              *content-type-map*)
                                     (if textp
                                         "text/plain"
                                         "application/binary")))))))

(defun write-binary-file-to-socket (channel filename)
  (let* ((namestring (namestring filename))
         (filename-buffer (make-filename-buffer :allocation :static
                                                :filename namestring))
         (fab (make-fab :allocation :static
                        :FAB$V_GET 1
                        :FAB$V_BIO 1
                        :FAB$V_SHRGET 1
                        :FAB$L_FNA filename-buffer
                        :FAB$B_FNS (length namestring)))
         (buffer (make-string-buffer :allocation :static))
         (rab (make-rab :allocation :static
                        :RAB$L_FAB fab
                        :RAB$L_UBF buffer
                        :RAB$W_USZ +buffer-size+)))
    (c SYS$OPEN fab 0 0)
    (c SYS$CONNECT rab 0 0)
    (loop
      (let ((status (call-out SYS$READ rab 0 0)))
        (when (= status RMS$_EOF)
          (return))
        (check-status status 'SYS$READ)
        ($QIOW/check-iosb channel IO$_WRITEVBLK
                          :p1 buffer
                          :p2 (RAB$W_RSZ rab))))
    (c SYS$CLOSE fab 0 0)))

(defun write-text-file-to-socket (channel filename)
  (let* ((buffer (make-array +buffer-size+
                             :allocation :static
                             :fill-pointer 0
                             :adjustable t
                             :element-type 'character)))
    (with-open-file (in filename)
      (with-output-to-string (*standard-output* buffer)
        (loop
          (let ((line (read-line in nil)))
            (when (null line)
              (return))
            (when (> (length line) (- +buffer-size+ 2))
              (error "line in file ~A too long, cannot serve as text file" filename))
            (when (> (+ (length buffer) (length line) 2) +buffer-size+)
              ($QIOW/check-iosb channel IO$_WRITEVBLK
                                :p1 buffer
                                :p2 (length buffer))
              (setf (fill-pointer buffer) 0)
              (get-output-stream-string *standard-output*))
            (format t "~A~C~C" line #\return #\linefeed)))))
    (when (plusp (length buffer))
      ($QIOW/check-iosb channel IO$_WRITEVBLK
                        :p1 buffer
                        :p2 (length buffer)))))

(defun write-file-response (channel file)
  (funcall (if (file-textp file)
               #'write-text-file-to-socket
               #'write-binary-file-to-socket)
           channel (file-pathname file)))

(defun uri-to-pathname (uri)
  "Return pathname represented by URI"
  (let ((dot-position (position #\. uri :from-end t))
        (slash-position (position #\/ uri :from-end t)))
    (when (and dot-position
               (> dot-position slash-position))
      (make-pathname
          :name (subseq uri (1+ slash-position) dot-position)
          :type (subseq uri (1+ dot-position))
          :directory (apply #'concatenate 'string
                            (directory-namestring *document-root*)
                            (when (plusp slash-position)
                              (list "."
                                    (substitute #\. #\/
                                                (subseq uri 1 slash-position)))))))))

(defstruct (file-response (:include response
                                    (write-body #'write-file-response))))

(defun route-as-file (request)
  (let ((pathname (probe-file (uri-to-pathname (request-uri request)))))
    (when pathname
      (make-file-response :status 200
                          :status-string "OK"
                          :body (file-information pathname)))))


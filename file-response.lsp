;; File responses

;; Serving VMS files as http responses is not quite as straightforward as
;; one would be used from Unix as one has to deal with the various file
;; structures that the VMS file system provides.  We have to distinguish
;; between binary and text files and treat them separately.  Binary files
;; are sent to the client as-is, i.e. the data is read block-wise from
;; the file and sent to the client unmodified.  As VAX LISP provides no
;; facilities for efficient block-wise binary I/O, we're using the VMS
;; Record Management System (RMS) directly.  For text files, we use the
;; VAX LISP file I/O system and read files line-by-line and send them
;; to the client with some intermediate buffering.

(in-package :rasselbock)

(provide 'file-response)

(eval-when (compile load eval)
  (require 'rmsdef)
  (require 'rmsusr)
  (require 'utils)
  (require 'vms)
  (require 'response))

(defun make-subdirectory (pathname subdirectory)
  (apply #'concatenate 'string
         (directory-namestring pathname)
         (when subdirectory
           (list "." subdirectory))))

;; Document root directory - This is set at run time from either the logical
;; name RASSELBOCK$DOCUMENT_ROOT or, if that is not defined, to the [.PUBLIC]
;; subdirectory of the process' default directory.
(defparameter *document-root* nil)

(defun get-document-root ()
  (let ((translations (translate-logical-name "RASSELBOCK$DOCUMENT_ROOT"))
        (default-document-root (make-pathname
                                   :directory (make-subdirectory 
                                                  (default-directory) "PUBLIC"))))
    (cond
      ((> (length translations) 1)
       (error "RASSELBOCK$DOCUMENT_ROOT translates to multiple directories, ~
               which is not supported."))
      ((= (length translations) 1)
       (pathname (first translations)))
      (t
       (warn "RASSELBOCK$DOCUMENT_ROOT not defined, serving files from ~A"
             (namestring default-document-root))
       default-document-root))))

(defun ensure-document-root ()
  (unless *document-root*
    (setf *document-root* (get-document-root))))

(defun document-root ()
  (c sys$dclast
     common-ast-address
     (instate-interrupt-function #'ensure-document-root :once-only-p t)
     0)
  *document-root*)

;; Provide some syntactic sugar to make using the GET-FILE-INFORMATION
;; function more pleasant.

(defmacro with-file-information ((file &rest fields) &body body)
  "Call GET-FILE-INFORMATION with FILE and FIELDS as arguments.  FIELDS
   must be one or more symbols that will be bound during the evaluation of
   BODY.  They specify what fields of file information should be retrieved
   and are converted to keywords when GET-FILE-INFORMATION is invoked."
  (let ((keywords (mapcar #'make-keyword fields))
        (result (gensym)))
    `(let* ((,result (get-file-information ,file ,@keywords))
            ,@(mapcar #'(lambda (variable keyword)
                          (list variable `(getf ,result ,keyword)))
                      fields (mapcar #'make-keyword fields)))
       ,@body)))

;; Map from file type (extension) to content type
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

;; The FILE structure contains information about the file being served.  When
;; a request is found to refer to a file, the body field of the response
;; returned by the file handler will contain a FILE structure that is then
;; used when writing the body to the client.

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
  "Serve a binary file to the client, using RMS to read blocks of file data
   directly into the buffer sent to the client using $QIOW."
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
  "Serve a text file to the client.  The file is read line-wise into a
   statically allocated string buffer.  Whenever the buffer would be overflown
   by the next line read from the file, it is flushed to the client.  This
   is supposed to reduce the number of packets sent to the client under the
   assumption that user-level buffering is cheaper than leaving this up to
   the TCP stack."
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
  "Write a file response body, dispatching to binary and text file writing
   as appropriate."
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
          :directory (make-subdirectory (document-root)
                                        (when (plusp slash-position)
                                          (substitute #\. #\/
                                                      (subseq uri 1 slash-position))))
          :defaults (document-root)))))

(defstruct (file-response (:include response
                                    (write-body #'write-file-response))))

(defun route-as-file (request)
  "If URI in the given REQUEST structure refers to a file in the file system,
   return a FILE-RESPONSE structure."
  (let* ((pathname (probe-file (uri-to-pathname (request-uri request))))
         (file (file-information pathname)))
    (when pathname
      (make-file-response :status 200
                          :status-string "OK"
                          :header (list :content-type (file-content-type file))
                          :body file))))


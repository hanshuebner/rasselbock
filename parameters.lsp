(in-package :rasselbock)

(provide 'parameters)

(eval-when (compile load eval)

  ;; String to report in Server: response header
  (defparameter *server-string* "VAX LISP HTTP Server 0.0")

  ;; Size of I/O buffers to read and write TCP data
  (defconstant +buffer-size+ 4096)
  ;; Size of a file name
  (defconstant +filename-size+ 255)

  ;; Maximum size of one HTTP header
  (defconstant +header-buffer-size+ 16384)

  ;; Maximum number of HTTP headers
  (defconstant +header-count+ 32)

  ;; Maximum number of pending incoming connections
  (defconstant +server-backlog+ 5)

  ;; HTTP version to report in responses
  (defparameter *response-http-version* "HTTP/1.0")

  ;; Document root directory
  (defparameter *document-root*
                (pathname
                    (or (first (translate-logical-name "rasselbock$document_root"))
                        (progn
                          (warn "rasselbock$document_root not defined, serving files from ~A"
                                (namestring (default-directory)))
                          (default-directory))))))


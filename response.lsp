;; Define the RESPONSE structure.  Instances of this structure are returned
;; by request handlers so that the web server can write the HTTP response
;; and header.  The WRITE-BODY field of the structure defines how the body
;; is written to the client.  By default, the BODY field is assumed to be
;; a string and written to the client as the body.  When serving files,
;; a different function is used to read from the file and write to the client
;; instead.

(in-package :rasselbock)

(require 'parameters)

(provide 'response)

(defstruct response
  (write-body #'write-string-to-socket)
  (status 200)
  (status-string "OK")
  header
  body)

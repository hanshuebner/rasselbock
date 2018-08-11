(in-package :rasselbock)

(require 'parameters)

(provide 'response)

(defstruct (response (:constructor make-response*))
  (write-body #'write-string-to-socket)
  (status 200)
  (status-string "OK")
  header
  body)

(defun make-response (&rest args &key status status-string header body)
  (declare (ignore status status-string body))
  (apply #'make-response*
         :header (concatenate 'list header `(:server *server-string*))
         args))

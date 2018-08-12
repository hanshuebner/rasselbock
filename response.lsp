(in-package :rasselbock)

(require 'parameters)

(provide 'response)

(defstruct response
  (write-body #'write-string-to-socket)
  (status 200)
  (status-string "OK")
  header
  body)

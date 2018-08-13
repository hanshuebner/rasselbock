(in-package :rasselbock)

(require 'response)
(require 'file-response)

(provide 'dispatch)

(defun redirect-to-index (request)
  (make-response :status 301
                 :status-string "Moved"
                 :header `(:location "/index.html")))

(defun not-found (request)
  (make-response :status 404
                 :status-string "Not found"
                 :body "The requested resource was not found"))

(defparameter *default-routes*
              `((GET / redirect-to-index)
                (GET /* route-as-file)
                (* /* not-found)))

(defvar *routes* *default-routes*)

(defun validate-uri-pattern (pattern)
  (unless (plusp (length pattern))
    (error "Invalid URI pattern ~S: Must not be empty"
           pattern))
  (unless (eql (aref pattern 0) #\/)
    (error "Invalid URI pattern ~S: Must begin with a slash"
           pattern))
  (let ((star-position (position #\* pattern)))
    (unless (or (null star-position)
                (= star-position (1- (length pattern))))
      (error "Invalid URI pattern ~S: Wildcard is allowed only at the end"
             pattern))))

(defun uri-match (uri pattern)
  (validate-uri-pattern pattern)
  (let ((star-position (1- (length pattern))))
    (if (eql (aref pattern star-position) #\*)
        (and (>= (length uri) star-position)
             (string= uri pattern
                      :end1 star-position
                      :end2 star-position))
        (string= uri pattern))))

(defun dispatch-request (request)
  (dolist (route *routes*)
    (when (and (or (string= (request-method request) (first route))
                   (string= (first route) "*"))
               (uri-match (request-uri request) (second route)))
      (let ((response (funcall (third route) request)))
        (when response
          (return response))))))

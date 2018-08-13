;; http request routing

;; The function DISPATCH-REQUEST receives an incoming http REQUEST structure
;; as argument and returns a RESPONSE structure, using the method and URI
;; fields to route the request to the designated handler.

(in-package :rasselbock)

(require 'response)
(require 'file-response)

(provide 'dispatch)

;; Handling functions for fixed functionalities

(defun redirect-to-index (request)
  "Return redirect response to the top-level HTML file, called index.html"
  (make-response :status 301
                 :status-string "Moved"
                 :header `(:location "/index.html")))

(defun not-found (request)
  "Return \"Resource not found\" response"
  (make-response :status 404
                 :status-string "Not found"
                 :body "The requested resource was not found"))

;; Define the default routing table.  Routes are searched from the front to
;; the back of the route list until a matching route is found (i.e. the
;; method and URI matches and the handling function returned a response).

(defparameter *default-routes*
              `((GET "/" redirect-to-index)
                (GET "/*" route-as-file)
                (* "/*" not-found)))

(defparameter *routes* *default-routes*)

(defun validate-uri-pattern (pattern)
  "Ensure that the PATTERN argument is a valid URI pattern string, starting
   with a slash and having at most one * wildcard at the end."
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
  "Return a true value if the URI argument matches the PATTERN.  PATTERN is
   validated using VALIDATE-URI-PATTERN before matching."
  (validate-uri-pattern pattern)
  (let ((star-position (1- (length pattern))))
    (if (eql (aref pattern star-position) #\*)
        (and (>= (length uri) star-position)
             (string= uri pattern
                      :end1 star-position
                      :end2 star-position))
        (string= uri pattern))))

(defun dispatch-request (request)
  "Route the REQUEST argument a handler based on the routes defined in
   the *ROUTES* special variable.  Returns a RESPONSE structure which
   contains the header and possible information about the body."
  (or (dolist (route *routes*)
        (when (and (or (string= (request-method request) (first route))
                       (string= (first route) "*"))
                   (uri-match (request-uri request) (second route)))
          (let ((response (funcall (third route) request)))
            (when response
              (assert (typep response 'response))
              (return response)))))
      (error "No route matched incoming request ~A" request)))

(in-package :rasselbock)

(defmacro doplist ((key value plist) &body body)
  (let ((current (gensym)))
    `(do* ((,current ,plist (cddr ,current))
           (,key (first ,current) (first ,current))
           (,value (second ,current) (second ,current)))
          ((not ,current))
       ,@body)))

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

(defun whitespacep (c)
  (or (eq c #\space)
      (eq c #\tab)
      (eq c #\linefeed)
      (eq c #\return)))

(defun make-keyword (string)
  (intern (string-upcase string) :keyword))

(defun urldecode (string)
  (with-output-to-string (*standard-output*)
    (with-input-from-string (*standard-input* string)
      (loop
        (let ((char (read-char nil nil)))
          (case char
            ((nil) (return))
            (#\+ (write-char #\space))
            (#\% (let ((string (make-string 2)))
                   (setf (aref string 0) (read-char)
                         (aref string 1) (read-char))
                   (write-char (code-char (parse-integer string :radix 16)))))
            (otherwise
                (write-char char))))))))


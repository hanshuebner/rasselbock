(in-package :rasselbock)

(eval-when (compile load eval)
  (load 'parameters))

(define-alien-structure iosb
  (status :unsigned-integer 0 2)
  (bytecnt :unsigned-integer 2 4)
  (details :pointer 4 8))

(define-alien-structure itemlst-2
  (length :unsigned-integer 0 2)
  (type :unsigned-integer 2 4 :default 0)
  (address :pointer 4 8))

(define-alien-structure itemlst-3
  (length :unsigned-integer 0 2)
  (type :unsigned-integer 2 4 :default 0)
  (address :pointer 4 8)
  (retlen :pointer 8 12 :default 0))

(define-alien-structure string-buffer
  (string :asciz 0 #.+buffer-size+))

(define-alien-structure filename-buffer
  (filename :asciz 0 #.+filename-size+))

(define-alien-structure short
  (value :unsigned-integer 0 2 :default 0))

(define-alien-structure long
  (value :unsigned-integer 0 4 :default 0))

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

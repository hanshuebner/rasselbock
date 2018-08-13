;; Structures and utility functions to interact with VMS system services

(in-package :rasselbock)

(eval-when (compile load eval)
  (load 'parameters :verbose nil :print nil))

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

(defun check-status (status caller)
  "Call ERROR with a format string that include CALLER and the VMS message
   if STATUS does not indicate success."
  (unless (successp status)
    (error (format nil "Error in ~A:~%~A"
                   caller
                   (get-vms-message status)))))

;; All VMS system calls return a status value, and most of the time it
;; is an error if a system call is not successful.  To avoid having to
;; explicitly check the status all the time, the C macro does it implicitly
;; and calls ERROR if the status does not indicate success.
(defmacro c (&rest call)
  (let ((status (gensym)))
    `(let ((,status (call-out ,@call)))
       (check-status ,status ',call))))

;; The $QIOW macro turns the 12 arguments that need to be supplied to
;; the SYS$QIOW system service into keyword parameters.  This makes
;; the call sites much cleaner.
(defmacro $QIOW (chan func iosb
                      &key
                      (efn 0)
                      astadr
                      astprm
                      p1 p2 p3 p4 p5 p6)
  `(c SYS$QIOW
      ,efn ,chan ,func ,iosb ,astadr ,astprm
      ,p1 ,p2 ,p3 ,p4 ,p5 ,p6))

;; Often, we need to invoke SYS$QIOW and check the status in the I/O status
;; block in addition to the status returned by the system call itself.  This
;; macro creates and IOSB, invokes SYS$QIOW checking its return value and
;; checks the IOSB status as well.
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

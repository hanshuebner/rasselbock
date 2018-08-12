;; load the rasselbock system

(in-package :rasselbock :use '(:sys :lisp))

(defun fas-file (lisp-file)
  (make-pathname :type "FAS" :version nil :defaults lisp-file))

(defun needs-recompile-p (lisp-file)
  (let* ((lisp-file (pathname lisp-file))
         (fas-file (fas-file lisp-file)))
    (or (not (probe-file fas-file))
        (> (file-write-date lisp-file) (file-write-date fas-file)))))

(defun ensure-sys-modules ()
  (dolist (lisp-file (directory "[.sys]*.lsp;"))
    (let ((needs-recompile-p (needs-recompile-p lisp-file))
          (fas-file (fas-file lisp-file)))
    (when needs-recompile-p
      (format t "~&;; Compiling ~A~%" (namestring lisp-file))
      (compile-file lisp-file))
    (when (or needs-recompile-p
              (not (find (pathname-name lisp-file) *modules* :test #'string-equal)))
      (format t "~&;; Loading ~A~%" (namestring fas-file))
      (load fas-file :verbose nil)))))

(ensure-sys-modules)

(dolist (file '(utils vms response file-response rasselbock))
  (load (compile-file file)))


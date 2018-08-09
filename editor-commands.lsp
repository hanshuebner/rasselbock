(in-package :editor)

(define-command (delete-matching-lines-command
                    :display-name "Delete Matching Lines")
                (prefix)
  (declare (ignore prefix))
  (let* ((match-string (simple-prompt-for-input "Delete lines containing:"))
         (search-pattern (make-search-pattern :case-insensitive
                                              :forward
                                              match-string)))
    (do* ((match (locate-pattern (current-buffer-point) search-pattern)
                 (locate-pattern (current-buffer-point) search-pattern)))
         ((null match))
      (setf (line-string (mark-line (current-buffer-point))) ""))))

(define-command (toggle-read-only-command
                    :display-name "Toggle Read Only")
                (prefix)
  (declare (ignore prefix))
  (setf (buffer-read-only (current-buffer))
        (not (buffer-read-only (current-buffer)))))

(bind-command "Toggle Read Only" '#(#\escape #\r) '(:style emacs))

(defmacro save-excursion (&body body)
  (let ((saved-position (gensym)))
    `(with-mark ((,saved-position (current-buffer-point)))
       (prog1
           (progn ,@body)
         (move-mark (current-buffer-point) ,saved-position)))))

(define-command (evaluate-top-level-form-command
                    :display-name "Evaluate Top Level Form")
                (prefix)
  (declare (ignore prefix))
  (save-excursion
    (select-outermost-form-command nil)
    (evaluate-lisp-region-command nil)))

(bind-command "Evaluate Top Level Form" '#(#\escape #\^X) '(:style emacs))

(define-command (evaluate-buffer-command
                    :display-name "Evaluate Buffer")
                (prefix)
  (declare (ignore prefix))
  (let ((current-package-name (package-name *package*)))
    (save-excursion
      (with-mark ((start (current-buffer-point))
                  (end (current-buffer-point)))
        (buffer-start start)
        (buffer-end end)
        (evaluate-lisp-region-command nil (make-region start end))))
    (in-package current-package-name)))

(bind-command "Evaluate Buffer" '#(#\^X #\^L) '(:style emacs))

(define-command (only-one-space-command 
                    :display-name "Only One Space")
                (prefix)
  (declare (ignore prefix))
  (if (or (eq (next-character (current-buffer-point)) #\space)
          (eq (previous-character (current-buffer-point)) #\space))
      (with-mark ((point (current-buffer-point))
                  (start (current-buffer-point)))
        ;; goto beginning of spaces
        (loop
          (if (eq (previous-character point) #\space)
              (character-offset point -1)
              (return)))
        (move-mark start point)
        ;; look for end of spaces
        (loop
          (if (eq (next-character point) #\space)
              (character-offset point 1)
              (return)))
        ;; remove spaces
        (character-offset point -1)
        (delete-region (make-region start point)))
      (editor-error "Not looking at space")))

(bind-command "Only One Space" '#(#\escape #\space))

(unbind-command #\^g '(:style emacs))
(bind-command "Pause Editor" '#(#\^X #\^Z) '(:style emacs))
(bind-command "Pause Editor" #\^Z '(:style emacs))
(bind-command "Prompt Show Alternatives" '#(#\escape #\^I) :global)

(bind-keyboard-function #\^E 'ed)

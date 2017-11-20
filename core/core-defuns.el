;;; core-defuns.el --- Custom functions required by other init files.

;;; code:
;; unfill a paragraph, i.e., make it so the text does not wrap in the
;; paragraph where the cursor is

(defun unfill-paragraph ()
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))

;; unfill a region, i.e., make is so the text in that region does not
;; wrap
(defun unfill-region ()
  (interactive)
  (let ((fill-column (point-max)))
    (fill-region (region-beginning) (region-end) nil)))

(defun system-is-mac ()
  (interactive)
  (string-equal system-type "darwin"))

(defun system-is-linux ()
  (interactive)
  (string-equal system-type "gnu/linux"))

(defun make-plugin-path (plugin)
  (expand-file-name
   (concat plugin-path plugin)))

(defun include-plugin (plugin)
  (add-to-list 'load-path (make-plugin-path plugin)))

(defun make-elget-path (plugin)
  (expand-file-name
   (concat elget-path plugin)))

(defun include-elget-plugin (plugin)
  (add-to-list 'load-path (make-elget-path plugin)))

;; Function for determining emacs dir paths.
(defun core/emacs.d (path)
  "Return path inside user's `.emacs.d'."
  (expand-file-name path user-emacs-directory))

(defun core/cache-for (identifier)
  "Return cache directory for given identifier."
  (expand-file-name identifier (core/emacs.d "var/cache")))

(defun core/mkdir-p (dir-path)
  "Make directory if it doesn't exist."
  (unless (file-exists-p dir-path)
    (make-directory dir-path t)))

(defun core/load-directory (directory)
  "Load recursively all `.el' files in DIRECTORY."
  (dolist (element (directory-files-and-attributes directory nil nil nil))
    (let* ((path (car element))
            (fullpath (concat directory "/" path))
            (isdir (car (cdr element)))
            (ignore-dir (or (string= path ".") (string= path ".."))))
      (cond
        ((and (eq isdir t) (not ignore-dir))
          (core/load-directory fullpath))
        ((and (eq isdir nil)
           (string= (substring path -3) ".el")
           (not (string-match "^\\." path)))
          (load (file-name-sans-extension fullpath)))))))

(defun create-new-buffer ()
  "Create a new buffer named *new*."
  (interactive)
  (switch-to-buffer (generate-new-buffer-name "*new*")))

(defun lm/smart-find-file ()
  "Find files using projectile if within a project, or fall-back to ido."
  (interactive)
  (if (projectile-project-p)
    (projectile-find-file)
    (ido-find-file)))

(defun lm/kill-default-buffer ()
  "Kill the currently active buffer."
  (interactive)
  (let (kill-buffer-query-functions) (kill-buffer)))

(defun switch-to-irc nil
  "Switch to IRC buffer using ido to select from candidates."
  (interactive)
  (let ((final-list (list ))
         (irc-modes '(circe-channel-mode
                       circe-query-mode
                       erc-mode)))

    (dolist (buf (buffer-list) final-list)
      (if (member (with-current-buffer buf major-mode) irc-modes)
        (setq final-list (append (list (buffer-name buf)) final-list))))
    (when final-list
      (switch-to-buffer (ido-completing-read "IRC Buffer: " final-list)))))

(defun lm/create-non-existent-directory ()
  "Prompt to automagically create parent directories."
  (let ((parent-directory (file-name-directory buffer-file-name)))
    (when (and (not (file-exists-p parent-directory))
            (y-or-n-p (format "Directory `%s' does not exist! Create it?" parent-directory)))
      (make-directory parent-directory t))))
(add-to-list 'find-file-not-found-functions #'lm/create-non-existent-directory)

(defmacro def (name &rest body)
  (declare (indent 1) (debug t))
  `(defun ,name (&optional _arg)
     ,(if (stringp (car body)) (car body))
     (interactive "p")
     ,@(if (stringp (car body)) (cdr `,body) body)))

(defmacro λ (&rest body)
  (declare (indent 1) (debug t))
  `(lambda ()
     (interactive)
     ,@body))

(defmacro add-λ (hook &rest body)
  (declare (indent 1) (debug t))
  `(add-hook ,hook (lambda () ,@body)))

(provide 'core-defuns)
;;; core-defuns ends here

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

;; Functions install Package
(defun package-require (pkg)
  "Runs `package-install', attempting `package-refresh-contents' on failure."
  (when (not (package-installed-p pkg))
    (package-install pkg)))

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

;; Add yasnippet support for company backends
;; https://github.com/syl20bnr/spacemacs/pull/179
(defun core/backend-with-yas (backend)
  (append (if (consp backend) backend (list backend))
    '(:with company-yasnippet)))

(provide 'core-defuns)
;;; core-defuns ends here

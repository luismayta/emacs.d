;;; core-functions.el --- Custom functions required by other init files.
;;; code:
(require 'core-vars)

;; Save buffer when file is modified
;; Used when switching buffers, exiting evil-insert-state
(defun core/save-if-bufferfilename ()
  (if (buffer-file-name)
    (progn
      (save-buffer)
      )
    )
  )

(defun system-is-mac ()
  (interactive)
  (string-equal system-type "darwin"))

(defun system-is-linux ()
  (interactive)
  (string-equal system-type "gnu/linux"))

;; Function for determining emacs dir paths.
(defun core-emacs.d (path)
  "Return path inside user's `.emacs.d'."
  (expand-file-name path user-emacs-directory))

(defun core/cache-for (identifier)
  "Return cache directory for given identifier."
  (expand-file-name identifier cache-directory))

(defun core/mkdir-p (dir-path)
  "Make directory if it doesn't exist."
  (unless (file-exists-p dir-path)
    (make-directory dir-path t)))

(defun core-load-directory (directory)
  "Load recursively all `.el' files in DIRECTORY."
  (dolist (element (directory-files-and-attributes directory nil nil nil))
    (let* ((path (car element))
           (fullpath (concat directory "/" path))
           (isdir (car (cdr element)))
           (ignore-dir (or (string= path ".") (string= path ".."))))
      (cond
       ((and (eq isdir t) (not ignore-dir))
        (load-directory fullpath))
       ((and (eq isdir nil) (string= (substring path -3) ".el"))
        (load (file-name-sans-extension fullpath)))))))

(defun core/create-new-buffer ()
  "Create a new buffer named *new*."
  (interactive)
  (switch-to-buffer (generate-new-buffer-name "*new*")))

(defun core/smart-find-file ()
  "Find files using projectile if within a project, or fall-back to ido."
  (interactive)
  (if (projectile-project-p)
    (counsel-projectile-find-file)
    (ido-find-file)))

(defun core/kill-default-buffer ()
  "Kill the currently active buffer."
  (interactive)
  (let (kill-buffer-query-functions) (kill-buffer)))

(defun core/create-non-existent-directory ()
  "Prompt to automagically create parent directories."
  (let ((parent-directory (file-name-directory buffer-file-name)))
    (when (and (not (file-exists-p parent-directory))
            (y-or-n-p (format "Directory `%s' does not exist! Create it?" parent-directory)))
      (make-directory parent-directory t))))

(add-to-list 'find-file-not-found-functions #'core/create-non-existent-directory)

(def core/prettyfy-change-symbols
  lambda  ()
  (mapc (lambda (pair) (push pair prettify-symbols-alist))
    '(;; Syntax
       ("def" .      #x2131)
       ("not" .      #x2757)
       ("in" .       #x2208)
       ("not in" .   #x2209)
       ("return" .   #x27fc)
       ("yield" .    #x27fb)
       ("for" .      #x2200)
       ;; Base Types
       ("int" .      #x2124)
       ("float" .    #x211d)
       ("str" .      #x1d54a)
       ("True" .     #x1d54b)
       ("False" .    #x1d53d)
       ;; Mypy
       ("Dict" .     #x1d507)
       ("List" .     #x2112)
       ("Tuple" .    #x2a02)
       ("Set" .      #x2126)
       ("Iterable" . #x1d50a)
       ("Any" .      #x2754)
       ("Union" .    #x22c3)))
  )

(defun add-to-load-path (dir) (add-to-list 'load-path dir)
  )

(defun add-to-load-path-if-exists (dir)
  "If DIR exists in the file system, add it to `load-path'."
  (when (file-exists-p dir)
    (add-to-load-path dir))
  )

(provide 'core-functions)
;;; core-functions ends here

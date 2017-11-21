;;; core-load-paths.el --- def vars.

;;; code:
(defun add-to-load-path (dir) (add-to-list 'load-path dir))

(defun add-to-load-path-if-exists (dir)
  "If DIR exists in the file system, add it to `load-path'."
  (when (file-exists-p dir)
    (add-to-load-path dir)))

;; paths
(defvar start-directory
  user-emacs-directory
  "Start directory.")

(defconst core-directory
  (expand-file-name (concat start-directory "core/"))
  "Core directory.")

(defconst modules-directory
  (expand-file-name (concat start-directory "modules/"))
  "Modules directory.")

(defconst elisp-directory
  (expand-file-name (concat start-directory "lib/elisp"))
  "Elisp directory.")

(defconst themes-directory
  (expand-file-name (concat start-directory "lib/color-themes"))
  "Themes directory.")

(defconst test-directory
  (expand-file-name (concat start-directory "tests/"))
  "Tests directory.")

(defconst exec-path
  (expand-file-name "/usr/local/bin")
  "Exec path directory.")

(add-to-list 'exec-path "/usr/local/bin")

;; load paths
(mapc 'add-to-load-path
  `(
     ,core-directory
     ,modules-directory
     ,elisp-directory
     ,themes-directory
     ))

(provide 'core-load-paths)
;;; core-load-paths ends here

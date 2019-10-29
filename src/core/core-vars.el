;;; core-vars.el --- def vars.

;;; code:

(defvar core/fixed-font-name "Fira Code Symbol")
(defvar core/frame-font "Fira Code Retina-17")
(defvar core/default-font "Fira Code Retina-17")
(defvar core/fixed-font-weight "retina")
(defvar core/var-font-name "Fira Code")
(defvar core/font-height 170)

;; vars for terminals.
(defvar core-term-shell "/usr/local/bin/zsh")

;; paths
(defvar start-directory
  user-emacs-directory
  "Start directory.")

(defconst private-directory
  (expand-file-name (concat start-directory "private/"))
  "Core directory.")

(defvar temp-dir
  (format "%s/cache" private-directory)
  "Hostname-based elisp temp directories.")

(defconst core-directory
  (expand-file-name (concat start-directory "src/core/"))
  "Core directory.")

(defconst modules-directory
  (expand-file-name (concat start-directory "src/modules/"))
  "Modules directory.")

(defconst elisp-directory
  (expand-file-name (concat start-directory "src/lib/elisp"))
  "Elisp directory.")

(defconst themes-directory
  (expand-file-name (concat start-directory "src/lib/color-themes"))
  "Themes directory.")

(defconst test-directory
  (expand-file-name (concat start-directory "tests/"))
  "Tests directory.")

(defconst cache-directory
  (expand-file-name (concat start-directory "var/cache"))
  "Cache directory.")

;(defconst exec-path
;  (expand-file-name "/usr/local/bin")
;  "Exec path directory.")

(provide 'core-vars)
;;; core-vars.el ends here

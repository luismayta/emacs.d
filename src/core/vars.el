;;; core/vars.el --- def vars.

;;; code:

(defvar core/fixed-font-name "FuraCode Nerd Font Mono")
(defvar core/frame-font "FuraCode Nerd Font Mono-18")
(defvar core/default-font "FuraCode Nerd Font Mono-18")
(defvar core/fixed-font-weight "retina")
(defvar core/var-font-name "FuraCode Nerd Font Mono")
(defvar core/font-height 170)

;; vars for terminals.
(defvar core-term-shell "/usr/local/bin/zsh")

;; paths
(defvar start-directory
  user-emacs-directory
  "Start directory.")

;; paths
(defvar core/vars/src-directory
  (expand-file-name (concat start-directory "src"))
  "src directory.")


(defconst private-directory
  (expand-file-name (concat start-directory "private/"))
  "Core directory.")

(defvar temp-dir
  (format "%s/cache" private-directory)
  "Hostname-based elisp temp directories.")

(defconst core-directory
  (expand-file-name (concat core/vars/src-directory "/core/"))
  "Core directory.")

(defconst modules-directory
  (expand-file-name (concat core/var/src-directory "/modules"))
  "Modules directory.")

(defconst core/vars/lib-directory
  (expand-file-name (concat core/vars/src-directory "/lib"))
  "core lib directory.")

(defconst elisp-directory
  (expand-file-name (concat core/vars/lib-directory "/elisp"))
  "Elisp directory.")

(defconst themes-directory
  (expand-file-name (concat core/vars/lib-directory "/color-themes"))
  "Themes directory.")

(defconst test-directory
  (expand-file-name (concat start-directory "tests/"))
  "Tests directory.")

(defconst cache-directory
  (expand-file-name (concat start-directory "var/cache"))
  "Cache directory.")


(provide 'core/vars)
;;; core/vars.el ends here

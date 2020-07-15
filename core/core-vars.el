;;; core-vars.el --- def vars.

;;; code:

(defvar core-fixed-font-name "FuraCode Nerd Font Mono")
(defvar core-frame-font "FuraCode Nerd Font Mono-18")
(defvar core-default-font "FuraCode Nerd Font Mono-18")
(defvar core-fixed-font-weight "retina")
(defvar core-var-font-name "FuraCode Nerd Font Mono")
(defvar core-font-height 180)

;; vars for terminals.
(defvar core-term-shell "/usr/local/bin/zsh")

;; paths
(defvar start-directory
  user-emacs-directory
  "Start directory.")

; paths
(defconst private-directory
  (expand-file-name (concat start-directory "private/"))
  "Core directory.")

(defvar temp-dir
  (format "%s/cache" private-directory)
  "Hostname-based elisp temp directories.")

(defconst core-directory
  (expand-file-name (concat start-directory "core/"))
  "Core directory.")

(defconst mode-directory
  (expand-file-name (concat start-directory "modes/"))
  "Modes directory.")

(defconst module-directory
  (expand-file-name (concat start-directory "modules/"))
  "Modules directory.")

(defconst config-directory
  (expand-file-name (concat start-directory "config/"))
  "Config directory.")

(defconst core-vars/lib-directory
  (expand-file-name (concat start-directory "lib/"))
  "core lib directory.")

(defconst elisp-directory
  (expand-file-name (concat core-vars/lib-directory "elisp/"))
  "Elisp directory.")

(defconst themes-directory
  (expand-file-name (concat core-vars/lib-directory "color-themes/"))
  "Themes directory.")

(defconst test-directory
  (expand-file-name (concat start-directory "tests/"))
  "Tests directory.")

(defconst cache-directory
  (expand-file-name (concat start-directory "var/cache/"))
  "Cache directory.")

(defconst IS-LINUX   (eq system-type 'gnu/linux))
(defconst IS-WINDOWS (memq system-type '(cygwin windows-nt ms-dos)))

(provide 'core-vars)
;;; core-vars.el ends here

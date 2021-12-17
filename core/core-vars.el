;;; core-vars.el --- def vars.

;;; code:

(defvar core-fixed-font-name "Fira Code")
(defvar core-frame-font "Fira Code Retina-19")
(defvar core-default-font "Fira Code Medium-19")
(defvar core-fixed-font-weight "retina")
(defvar core-var-font-name "Fira Code Retina")
(defvar core-font-height 190)

(defvar core-leader-key ",")

;; vars for terminals.
(defvar core-term-shell "/usr/local/bin/zsh")

(defvar core--after-display-functions nil
  "List of functions to be run (in reverse order) after the
display system is initialized.")

(defvar core-company-global-backends nil
  "List of backends to enable everywhere.")

;; paths
(defvar start-directory
  user-emacs-directory
  "Start directory.")

(defvar fd-command
  (format "%s . --color=never --type f -0 -H -E .git"
    "fd")
  )

(defconst private-directory
  (expand-file-name (concat start-directory "private/"))
  "Core directory.")

(defvar temp-dir
  (format "%s/cache" private-directory)
  "Hostname-based elisp temp directories.")

(defconst var-directory
  (expand-file-name (concat start-directory "var/"))
  "Var directory.")

(defconst core-directory
  (expand-file-name (concat start-directory "core/"))
  "Core directory.")

(defconst mode-directory
  (expand-file-name (concat start-directory "modes/"))
  "Modes directory.")

(defconst module-directory
  (expand-file-name (concat start-directory "modules/"))
  "Modules directory.")

(defconst snippets-directory
  (expand-file-name (concat start-directory "snippets/"))
  "Modules directory.")

(defconst config-directory
  (expand-file-name (concat start-directory "config/"))
  "Config directory.")

(defconst lib-directory
  (expand-file-name (concat start-directory "lib/"))
  "core lib directory.")

(defconst test-directory
  (expand-file-name (concat start-directory "tests/"))
  "Tests directory.")

(defconst elisp-directory
  (expand-file-name (concat lib-directory "elisp/"))
  "Elisp directory.")

(defconst themes-directory
  (expand-file-name (concat lib-directory "color-themes/"))
  "Themes directory.")

(defconst cache-directory
  (expand-file-name (concat var-directory "cache/"))
  "Var directory.")

(defconst backup-directory
  (expand-file-name (concat var-directory "backups/"))
  "Var directory.")

(defconst IS-LINUX   (eq system-type 'gnu/linux))
(defconst IS-WINDOWS (memq system-type '(cygwin windows-nt ms-dos)))

(defvar core-gc-cons-threshold (* 2 1024 1024) ; 1mb
  "The default value to use for `gc-cons-threshold'. If you experience freezing,
decrease this. If you experience stuttering, increase this.")

(defvar core-gc-cons-upper-limit 536870912 ; 512mb
  "The temporary value for `gc-cons-threshold' to defer it.")

(defvar core-read-process-output-max (* 2 1024 1024) ;; 1mb
  "The temporary value for `read-process-output-max' to defer it.")

(provide 'core-vars)
;;; core-vars.el ends here

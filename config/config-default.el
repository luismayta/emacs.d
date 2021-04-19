;;; config-default --- settings default;
;; default settings.

(setq package-enable-at-startup nil)

(setq explicit-shell-file-name core-term-shell)
(setenv "SHELL" core-term-shell)
(setq shell-file-name "zsh")
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; UTF-8 as default encoding
;; Character encodings default to utf-8.
(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LANG" "en_US.UTF-8")
(setenv "LC_CTYPE" "en_US.UTF-8")

(setq package-enable-at-startup nil
  tool-bar-mode nil
  menu-bar-mode nil)

;; Disable annoying lock files.
(setq create-lockfiles nil)
(setq auto-save-default nil)
(setq make-backup-files nil)
(set (make-local-variable 'backup-inhibited) t)

(if auto-save-default
	(auto-save-mode -1))

(when (fboundp 'tooltip-mode)    (tooltip-mode    -1))
(when (fboundp 'menu-bar-mode)   (menu-bar-mode   -1))
(when (fboundp 'tool-bar-mode)   (tool-bar-mode   -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(provide 'config-default)
;;; config-default ends here

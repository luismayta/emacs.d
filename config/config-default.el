;;; config-default --- settings default;
;; default settings.

(setq package-enable-at-startup nil)

(setq explicit-shell-file-name core-term-shell)
(setenv "SHELL" core-term-shell)
(setq shell-file-name "zsh")
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; Increase the GC threshold as soon as possible.
(setq gc-cons-threshold 50000000)

(provide 'config-default)
;;; config-default ends here

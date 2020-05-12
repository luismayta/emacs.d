;;; config/default --- settings default;
;; default settings.

(setq package-enable-at-startup nil)

(setq explicit-shell-file-name core-term-shell)
(setenv "SHELL" core-term-shell)
(setq shell-file-name "zsh")
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; Increase the GC threshold as soon as possible.
(setq gc-cons-threshold 50000000)

;; disabled chekc signature
(setq package-check-signature nil)

(provide 'config/default)
;;; config/default ends here


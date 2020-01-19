;;; module-coding-sh.el --- sh settings.
;;; code:

(use-package sh-script
  :mode (("\\.zunit\\'" . sh-mode)
          ("/bspwmrc\\'" . sh-mode)))

(use-package company-shell
  :after sh-script
  :config
  (setq company-shell-delete-duplicates t))

(provide 'module-coding-sh)
;;; module-coding-sh.el ends here

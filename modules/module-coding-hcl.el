;;; module-coding-hcl.el --- hcl settings.
;;; code:

(use-package terraform-mode
  :mode ("\\.inc\\'" . terraform-mode))

(use-package hcl-mode
  :mode ("\\.sentinel\\'" . hcl-mode))

(provide 'module-coding-hcl)
;;; module-coding-hcl.el ends here

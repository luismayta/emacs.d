;;; module/hcl.el --- hcl settings.
;;; code:

(use-package terraform-mode
  :mode ("\\.inc\\'" . terraform-mode))

(use-package hcl-mode
  :mode ("\\.sentinel\\'" . hcl-mode))

(provide 'module/hcl)
;;; module/hcl.el ends here

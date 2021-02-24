;;; module/hashicorp.el --- Hashicorp settings.
;;; code:

(use-package terraform-mode
  :mode ("\\.inc\\'" . terraform-mode))

(use-package hcl-mode)

(provide 'module/hashicorp)
;;; module/hashicorp.el ends here

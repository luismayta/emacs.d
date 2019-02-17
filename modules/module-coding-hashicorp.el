;;; module-coding-hashicorp.el --- Hashicorp settings.
;;; code:

(use-package terraform-mode
  :mode ("\\.inc\\'" . terraform-mode))

(use-package hcl-mode)

(provide 'module-coding-hashicorp)
;;; module-coding-hashicorp.el ends here

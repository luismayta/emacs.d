;;; module-hashicorp.el --- Hashicorp settings.
;;; code:

(use-package terraform-mode
  :mode ("\\.inc\\'" . terraform-mode)
  :hook
  (terraform-mode . lsp-deferred)
  )

(use-package hcl-mode
  :mode ("\\.sentinel\\'" . hcl-mode))

(provide 'module-hashicorp)
;;; module-hashicorp.el ends here

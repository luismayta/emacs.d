;;; module-hashicorp.el --- Hashicorp settings.
;;; code:

(use-package terraform-mode
  :mode (("\\.inc$" . terraform-mode)
          ("\\.tfvars$" . terraform-mode)
          ("\\.tf$" . terraform-mode))
  :ensure-system-package
  ((terraform-ls . "brew install hashicorp/tap/terraform-ls")
    )
  :hook
  (terraform-mode . lsp-deferred)
  )

(use-package hcl-mode
  :mode ("\\.sentinel\\'" . hcl-mode))

(provide 'module-hashicorp)
;;; module-hashicorp.el ends here

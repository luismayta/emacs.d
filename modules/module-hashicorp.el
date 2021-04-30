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
  :config
  (progn
    (add-to-list 'lsp-disabled-clients 'terraform-lsp)
    (add-to-list 'lsp-language-id-configuration '(hcl-mode . "hcl"))

    (lsp-register-client
      (make-lsp-client :new-connection (lsp-stdio-connection '("terraform-ls" "serve"))
        :major-modes '(terraform-mode hcl-mode)
        :server-id 'terraform-ls)))
  )

(use-package hcl-mode
  :mode ("\\.sentinel\\'" . hcl-mode))

(provide 'module-hashicorp)
;;; module-hashicorp.el ends here

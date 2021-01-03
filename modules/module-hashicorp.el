;;; module-hashicorp.el --- Hashicorp settings.
;;; code:

(use-package terraform-mode
  :mode ("\\.inc\\'" . terraform-mode)
	:hook
    (terraform-mode . format-all-mode)
)

(provide 'module-hashicorp)
;;; module-hashicorp.el ends here

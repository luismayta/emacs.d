;;; module-go.el --- Golang config.
;;; code:

(use-package go-imports)

(use-package go-autocomplete
  :ensure t
  :config
  (ac-config-default))

(use-package go-guru
  :ensure t
  :config
  (go-guru-hl-identifier-mode)
  )

(use-package company-go
  :ensure t
  :after go
  )

(use-package go-mode
  :after (go-autocomplete)
  :mode ("\\.go" . go-mode)
  :init
  :config
  (setq auto-mode-alist
    (append '(("go.mod" . text-mode)) auto-mode-alist))
  (defun my-go-mode-hook ()
    (setq gofmt-command "goimports")
    (setq godoc-command "godoc")
    (setq tab-width 4)
    (set (make-local-variable 'company-backends) '(company-go))
    (company-mode))
  (add-hook 'go-mode-hook 'my-go-mode-hook)

  (add-hook 'go-mode-hook 'go-eldoc-setup)
  (add-hook 'go-mode-hook #'go-guru-hl-identifier-mode)
  (add-hook 'go-mode-hook 'flycheck-mode)
  (add-hook 'before-save-hook 'gofmt-before-save)
  )

(use-package go-impl
	:after go-mode)

(use-package go-add-tags
	:after go-mode)

(use-package go-eldoc
  :after (go-mode)
  :commands (go-eldoc-setup)
  :diminish eldoc-mode
  :config
  (add-hook 'go-mode-hook #'go-eldoc-setup))

(use-package go-stacktracer)

(provide 'module-go)
;;; module-go.el ends here

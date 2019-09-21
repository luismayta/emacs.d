;;; module-coding-go.el --- Golang config.
;;; code:

(use-package go-imports)
(setq gofmt-command "goimports")
(use-package go-mode
  :ensure t
  :config
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  :commands
  (go-mode)
  :pin melpa)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package go-errcheck)

(use-package golint)

(use-package auto-complete
  :ensure t
  :pin melpa)

(use-package go-autocomplete
  :ensure t
  :pin melpa)

(use-package flycheck-gometalinter
  :ensure t
  :config
  (flycheck-gometalinter-setup)
  (setq flycheck-gometalinter-fast t)
  (setq flycheck-gometalinter-disable-linters '("gotype")))

;; company-go
(use-package company-go
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'company
    (add-to-list 'company-backends 'company-go)))

;; go-add-tags
(use-package go-add-tags
  :ensure t
  :config
  (with-eval-after-load 'go-mode
    (define-key go-mode-map (kbd "C-c t") #'go-add-tags)))

;; go-eldoc
(use-package go-eldoc
  :ensure t
  :config
  (add-hook 'go-mode-hook 'go-eldoc-setup))

(provide 'module-coding-go)
;;; module-coding-go.el ends here

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

(use-package speedbar
  :config
  (speedbar-add-supported-extension ".go"))

(use-package go-complete
  :init
  (add-hook 'completion-at-point-functions 'go-complete-at-point))

(provide 'module-coding-go)
;;; module-coding-go.el ends here

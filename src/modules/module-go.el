;;; module-go.el --- Golang config.
;;; code:

(defvar go-mode)
(defvar go-eldoc)
(defvar go-stacktracer)
(defvar go-autocomplete)
(defvar before-save-hook)


(use-package go-imports)

(setq gofmt-command "goimports")

(use-package go-autocomplete
  :ensure t
  :config
  (ac-config-default))

(use-package go-guru
  :ensure t
  :config
  (go-guru-hl-identifier-mode))

(use-package company-go
  :ensure t
  :after go
  :config
  (setq tab-width 4))

(use-package go-mode
  :after (go-autocomplete)
  :commands (gofmt-before-save)
  :defer t
  :config
  (setq auto-mode-alist
    (append '(("go.mod" . text-mode)) auto-mode-alist))
  (add-hook 'go-mode-hook (lambda ()
                            (setq indent-tabs-mode t)
                            (setq tab-width 4)))
  (add-hook 'before-save-hook #'gofmt-before-save))

(use-package go-eldoc
  :after (go-mode)
  :commands (go-eldoc-setup)
  :diminish eldoc-mode
  :config
  (add-hook 'go-mode-hook #'go-eldoc-setup))

(use-package go-stacktracer)

(provide 'module-go)
;;; module-go.el ends here

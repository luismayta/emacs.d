;;; module-go.el --- Golang config.
;;; code:

(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t)
  )

(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

(use-package go-mode
  :after (lsp-mode multi-compile)
  :mode ("\\.go$" . go-mode)
  :mode ("go\\.mod\\'" . go-dot-mod-mode)
  :commands (go-mode go-dot-mod-mode)
  :init
  (setq lsp-gopls-staticcheck t
    lsp-eldoc-render-all t
    lsp-gopls-complete-unimported t)
  (lsp-register-custom-settings
    '(
       ("gopls.completeUnimported" t t)
       ("gopls.staticcheck" t t)
       ("gopls.usePlaceholders" t t)
       ("gopls.hoverKind" "SynopsisDocumentation")
       )
    )
  :config
  (when (executable-find "gofmt")
    (setq-default gofmt-command (executable-find "gofmt"))
    (add-hook 'before-save-hook 'gofmt-before-save)
    )
  (when (executable-find "goimports")
    (setq-default gofmt-command (executable-find "goimports")))
  (add-to-list 'multi-compile-alist
    '(go-mode . (("build/git" "go build -v ./..."
                   (locate-dominating-file buffer-file-name ".git"))
                  ("build/mod" "go build -v ./..."
                    (locate-dominating-file buffer-file-name "go.mod"))
                  ("lint/git" "golangci-lint run ./..."
                    (locate-dominating-file buffer-file-name ".git"))
                  ("lint/git/fix" "golangci-lint run --fix ./..."
                    (locate-dominating-file buffer-file-name ".git"))
                  ("mod/deps/download" "go mod download"
                    (locate-dominating-file buffer-file-name "go.mod"))
                  ("all/generate" "go generate -v ./..."
                    (locate-dominating-file buffer-file-name "go.mod"))
                  ("bin/install" "go install -v ./cmd/..."
                    (locate-dominating-file buffer-file-name "go.mod"))
                  ("docker/build" "docker-compose build"
                    (locate-dominating-file buffer-file-name "go.mod"))
                  ("mod/deps/update" "go get -u ./..."
                    (locate-dominating-file buffer-file-name "go.mod"))
                  ("mod/deps/gc" "go mod tidy"
                    (locate-dominating-file buffer-file-name "go.mod"))
                  )))
  :hook
  (go-mode-hook . lsp-deferred)
  )

(use-package go-autocomplete
  :after (go-mode)
  :ensure t
  :config
  (defun auto-complete-for-go ()
    (auto-complete-mode 1))
  (add-hook 'go-mode-hook 'auto-complete-for-go))

(use-package go-gopath
  :after go-mode
  )
(use-package go-stacktracer
  :after go-mode
  )
(use-package go-fill-struct
  :after go-mode
  )
(use-package go-impl
  :after go-mode
  )
(use-package go-gen-test
  :after go-mode
  )
(use-package go-tag
  :after go-mode
  )

(use-package flycheck-golangci-lint
  :after (flycheck go-mode)
  :hook (go-mode-hook . flycheck-golangci-lint-setup))

(use-package dap-go
  :disabled
  :after dap-mode)

(use-package gotest
  :after go-mode)

(provide 'module-go)
;;; module-go.el ends here

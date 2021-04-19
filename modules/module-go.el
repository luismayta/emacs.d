;;; module-go.el --- Golang config.
;;; code:

(use-package go-mode
  :ensure t
  :ensure-system-package
  ((gocode . "go get -u github.com/mdempsky/gocode")
    (goimports . "go get -u golang.org/x/tools/cmd/goimports")
    (gorename . "go get -u golang.org/x/tools/cmd/gorename")
    (fillstruct . "go get -u github.com/davidrjenni/reftools/cmd/fillstruct")
    )
  :mode "\\.go\\'"
  :hook
  (go-mode . lsp-deferred)
  )

(use-package go-eldoc
  :ensure t
  :ensure-system-package (
                           (godoc . "go get golang.org/x/tools/cmd/godoc")
                           )
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

(use-package go-add-tags
  :after go-mode
  )

(use-package flycheck-golangci-lint
  :after (flycheck go-mode)
  :hook (go-mode-hook . flycheck-golangci-lint-setup))

(use-package gotest
  :after go-mode)

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
                                        ; (add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

(provide 'module-go)
;;; module-go.el ends here

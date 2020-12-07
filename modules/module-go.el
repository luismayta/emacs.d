;;; module-go.el --- Golang config.
;;; code:

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

(provide 'module-go)
;;; module-go.el ends here

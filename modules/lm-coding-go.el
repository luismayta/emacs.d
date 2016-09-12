;;; lm-coding-go.el --- Golang config.
;;; code:

(use-package go-eldoc)
(use-package golint)
(use-package go-autocomplete)
(use-package go-errcheck)

(use-package go-mode
  :init
  (add-hook 'before-save-hook 'gofmt-before-save)
  :commands go-mode)

(provide 'lm-coding-go)

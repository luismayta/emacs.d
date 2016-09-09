;;; -*- Emacs-Lisp -*-
;;; code:
;; Settings for `go-mode'.
;;requires modules
;;install packages go
;;go get -u github.com/nsf/gocode
;;go get golang.org/x/tools/cmd/oracle
;;go get -u github.com/dougm/goflymake
;;install package company-go
;;http://yousefourabi.com/blog/2014/05/emacs-for-go/

(package-require 'go-mode)
(package-require 'go-eldoc)
(package-require 'golint)
(package-require 'go-autocomplete)
(package-require 'go-errcheck)

(require 'go-mode)
(require 'go-autocomplete)
(require 'auto-complete-config)
(require 'go-errcheck)
(require 'go-eldoc)
(require 'golint)

;; Load GOPATH from shell - OSX related
(exec-path-from-shell-copy-env "GOPATH")

(add-hook 'before-save-hook 'gofmt-before-save)

(ac-config-default)

(provide 'go-settings)

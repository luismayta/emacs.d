;; -*- Emacs-Lisp -*-
;; Settings for `go-mode'.
;;requires modules
;;install packages go
;;go get -u github.com/nsf/gocode
;;go get golang.org/x/tools/cmd/oracle
;;go get -u github.com/dougm/goflymake
;;install package company-go
;;http://yousefourabi.com/blog/2014/05/emacs-for-go/

(bundle 'go-mode nil)
(bundle 'go-eldoc nil)
(bundle 'golint nil)
(bundle 'go-autocomplete nil)
(bundle 'go-errcheck nil)

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

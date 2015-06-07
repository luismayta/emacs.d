;;requires modules
;;install packages go
;;go get -u github.com/nsf/gocode
;;go get golang.org/x/tools/cmd/oracle
;;go get -u github.com/dougm/goflymake
;;install package company-go
;;http://yousefourabi.com/blog/2014/05/emacs-for-go/
;;http://dominik.honnef.co/posts/2013/03/writing_go_in_emacs/

(bundle 'go-mode nil)
(bundle 'go-eldoc nil)
(bundle 'golint nil)
;;(bundle 'go-flymake nil)
(bundle 'go-autocomplete nil)

(require 'go-eldoc)
(require 'go-mode)
(require 'golint)
;;(require 'go-flymake)
(require 'go-autocomplete)
;;(require 'company-mode)

(add-hook 'go-mode-hook 'go-eldoc-setup)

(set-face-attribute 'eldoc-highlight-function-argument nil
                    :underline t :foreground "green"
                                        :weight 'bold)

(add-hook 'before-save-hook 'gofmt-before-save)

(load "$GOPATH/src/golang.org/x/tools/cmd/oracle/oracle.el")
(add-hook 'go-mode-hook 'go-oracle-mode)

;;(add-to-list 'load-path "$GOPATH/src/github.com/dougm/goflymake")

;;(add-hook 'go-mode-hook 'company-mode)
;;(add-hook 'go-mode-hook (lambda ()
;;                          (set (make-local-variable 'company-backends) '(company-go))
;;                            (company-mode)))

;;shortcuts

(add-hook 'go-mode-hook '(lambda ()
                             (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))

(add-hook 'go-mode-hook '(lambda ()
                             (local-set-key (kbd "C-c C-g") 'go-goto-imports)))

(add-hook 'go-mode-hook '(lambda ()
                           (local-set-key (kbd "C-c C-f") 'gofmt)))
(add-hook 'before-save-hook 'gofmt-before-save)

(add-hook 'go-mode-hook '(lambda ()
                             (local-set-key (kbd "C-c C-k") 'godoc)))

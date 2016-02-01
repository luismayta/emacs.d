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

(require 'auto-complete-config)
(require 'go-eldoc)
(require 'go-mode)
(require 'golint)
(require 'go-autocomplete)
(ac-config-default)

(defun go-mode-setup ()
  (setq compile-command "go build -v && go test -v && go vet")
  (define-key (current-local-map) "\C-c\C-c" 'compile)
  (go-eldoc-setup)
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'before-save-hook 'go-remove-unused-imports)
  (local-set-key (kbd "M-.") 'godef-jump))

(add-hook 'go-mode-hook 'go-mode-setup)


(set-face-attribute 'eldoc-highlight-function-argument nil
                    :underline t :foreground "green"
                                        :weight 'bold)

;; (add-hook 'go-mode-hook '(lambda ()
;;                              (local-set-key (kbd "C-c C-g") 'go-goto-imports)))


;; (add-hook 'go-mode-hook '(lambda ()
;;                              (local-set-key (kbd "C-c C-k") 'godoc)))

(provide 'go-settings)

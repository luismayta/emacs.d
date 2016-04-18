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

(require 'go-eldoc)
(require 'go-mode)
(require 'golint)
(require 'go-autocomplete)
(require 'gocode-settings)

(defun go-remove-unused-imports-before-save ()
  "Add this to .emacs to run `go-remove-unused-imports' on buffer saving:
 (add-hook 'before-save-hook 'go-remove-unused-imports)."

  (interactive)
  (when (eq major-mode 'go-mode)
    (go-remove-unused-imports nil)))


(defun go-mode-settings ()
  "Settings for `go-mode'."

  ;; run gofmt on the current buffer when saving
  ;; non `go-mode' buffer would be intact
  (add-hook 'before-save-hook 'gofmt-before-save)

  ;; TODO not working now, fix it
  ;; run `go-remove-unused-imports' on the current buffer when saving
  (add-hook 'before-save-hook 'go-remove-unused-imports-before-save)

  ;; add fonts color editor

  (set-face-attribute 'eldoc-highlight-function-argument nil
                    :underline t :foreground "green"
                                        :weight 'bold)

  ;; key bindings
  ;; (dw-hungry-delete-on-mode-map go-mode-map)
  ;; (dw-commet-dwin-on-mode-map go-mode-map)

  ;; Enable `subword-mode' since go is Camel style.
  (add-hook 'go-mode-hook
            '(lambda ()
               (subword-mode)))
  )

(eval-after-load "go-mode"
  `(go-mode-settings))


(provide 'go-settings)

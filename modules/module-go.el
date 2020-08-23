;;; module-go.el --- Golang config.
;;; code:


(use-package go-mode)

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
   (add-hook 'before-save-hook #'lsp-format-buffer t t)
   (add-hook 'before-save-hook #'lsp-organize-imports t t))

(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)


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

(use-package go-add-tags
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

;(use-package use-package-hydra
;  :ensure t)

;;; go hydra
;(use-package hydra
;  :ensure t
;  :config
;  (require 'hydra)
;  (require 'dap-mode)
;  (require 'dap-ui)
;  ;;:commands (ace-flyspell-setup)
;  :bind
;  ;;("M-s" . hydra-go/body)
;  :init
;  (add-hook 'dap-stopped-hook
;    (lambda (arg) (call-interactively #'hydra-go/body)))
;  :hydra (hydra-go (:color pink :hint nil :foreign-keys run)
;           "
;   _n_: Next       _c_: Continue _g_: goroutines      _i_: break log
;   _s_: Step in    _o_: Step out _k_: break condition _h_: break hit condition
;   _Q_: Disconnect _q_: quit     _l_: locals
;   "
;	         ("n" dap-next)
;	         ("c" dap-continue)
;	         ("s" dap-step-in)
;	         ("o" dap-step-out)
;	         ("g" dap-ui-sessions)
;	         ("l" dap-ui-locals)
;	         ("e" dap-eval-thing-at-point)
;	         ("h" dap-breakpoint-hit-condition)
;	         ("k" dap-breakpoint-condition)
;	         ("i" dap-breakpoint-log-message)
;	         ("q" nil "quit" :color blue)
;	         ("Q" dap-disconnect :color red)))

(provide 'module-go)
;;; module-go.el ends here

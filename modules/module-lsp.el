;;; module-lsp.el --- lsp config.
;;; code:

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; Optional - provides fancier overlays.
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

;; Optional - provides snippet support.
(use-package yasnippet
  :ensure t
  :commands yas-minor-mode
  :hook (go-mode . yas-minor-mode))

;; if you are helm user
; (use-package helm-lsp :commands helm-lsp-workspace-symbol)

;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)

; (use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
(use-package which-key
  :config
  (which-key-mode))

(use-package lsp-mode
	:ensure nil
  :commands (lsp lsp-deferred)
  :hook ((lsp-mode . lsp-enable-which-key-integration)
          (python-mode . lsp-deferred)
          (lua-mode . lsp-deferred)
          (c-mode . lsp-deferred)
          (go-mode . lsp-deferred)
          (java-mode . lsp-deferred)
          (js-mode . lsp-deferred)
          (web-mode . lsp-deferred)
          (terraform-mode	. lsp-deferred)
          (html-mode . lsp-deferred))
  :custom
  (
   setq lsp-enable-indentation nil
    lsp-log-io nil
    lsp-prefer-flymake nil
    lsp-trace nil
		lsp-inhibit-message t
		lsp-eldoc-render-all t
		lsp-enable-file-watchers nil
		lsp-highlight-symbol-at-point nil
    )
  :config
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection '("terraform-ls" "serve"))
                  :major-modes '(terraform-mode)
                  :server-id 'terraform-ls)
   )
  (add-hook 'terraform-mode-hook #'lsp)
  )

(use-package lsp-ui
	:after lsp-mode
	:ensure t
	:config
	(setq lsp-ui-sideline-enable nil
		lsp-ui-doc-enable nil
		lsp-ui-flycheck-enable t
		lsp-prefer-flymake nil
		lsp-ui-imenu-enable t
		lsp-ui-sideline-ignore-duplicate t))

(provide 'module-lsp)
;;; module-lsp.el ends here

;;; module-lsp.el --- lsp config.
;;; code:

;; Optional - provides snippet support.
(use-package yasnippet
  :ensure t
  :commands yas-minor-mode
  :hook (go-mode . yas-minor-mode))

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
  :config (progn
	          (setq gc-cons-threshold 100000000)
	          (setq read-process-output-max (* 2 1024 1024)) ;; 1mb
	          (setq company-minimum-prefix-length 1
		          company-idle-delay 0.0) ;; default is 0.2
            (setq lsp-prefer-flymake nil))
  :hook ((lsp-mode . lsp-enable-which-key-integration)
          (python-mode . lsp-deferred)
          (lua-mode . lsp-deferred)
          (c-mode . lsp-deferred)
          (go-mode . lsp-deferred)
          (ruby-mode . lsp-deferred)
          (java-mode . lsp-deferred)
          (js-mode . lsp-deferred)
          (web-mode . lsp-deferred)
          (terraform-mode	. lsp-deferred)
          (rust-mode . lsp-deferred)
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
    ))

(use-package lsp-ui
	:after lsp-mode
	:ensure t
  :commands lsp-ui-mode
	:config
	(setq lsp-ui-sideline-enable nil
		lsp-ui-doc-enable nil
		lsp-ui-flycheck-enable t
		lsp-prefer-flymake nil
		lsp-ui-imenu-enable t
		lsp-ui-sideline-ignore-duplicate t))

(use-package helm-lsp :ensure t :commands helm-lsp-workspace-symbol)
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)

(provide 'module-lsp)
;;; module-lsp.el ends here

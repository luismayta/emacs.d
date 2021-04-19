;;; module-lsp.el --- lsp config.
;;; code:
(require 'core-vars)

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
  :config
  (progn
    (setq lsp-auto-configure t)
    (setq lsp-auto-guess-root t)
	  (setq gc-cons-threshold core-gc-cons-threshold)
	  (setq read-process-output-max core-read-process-output-max) ;; 1mb
	  (setq company-minimum-prefix-length 1
		  company-idle-delay 0.0) ;; default is 0.2
    (setq lsp-prefer-flymake nil)
    ;; don't set flymake or lsp-ui so the default linter doesn't get trampled
    (setq lsp-diagnostic-package :none)
    )
  (evil-leader/set-key
    "jd"  #'lsp-goto-type-definition ; (j)ump to (d)efinition
    "jb"  #'xref-pop-marker-stack)  ; (j)ump (b)ack to marker
  :hook (
          (lsp-mode . lsp-enable-which-key-integration)
          ;; (sh-mode . lsp-deferred) ;; npm i -g bash-language-server
          ;; (c-mode . lsp-deferred)
          ;; (java-mode . lsp-deferred)
          (json-mode . lsp-deferred) ;; yarn global add vscode-json-languageserver
          ((js2-mode rjsx-mode typescript-mode) . lsp-deferred) ;; https://www.chadstovern.com/javascript-in-emacs-revisited/
          (web-mode . lsp-deferred) ;; yarn global add hmtl-ls
          ;; (rust-mode . lsp-deferred)
          (html-mode . lsp-deferred)
          )
  :custom
  (
    setq lsp-enable-indentation nil
    lsp-log-io t
    lsp-prefer-flymake nil
    lsp-trace nil
		lsp-inhibit-message t
		lsp-eldoc-render-all t
		lsp-enable-file-watchers nil
		lsp-highlight-symbol-at-point t
    )
  )

(use-package lsp-ui
  :defer t
  :config
  (setq lsp-ui-sideline-enable t
    ;; disable flycheck setup so default linter isn't trampled
    lsp-ui-flycheck-enable nil
    lsp-ui-sideline-show-symbol nil
    lsp-ui-sideline-show-hover nil
    lsp-ui-sideline-show-code-actions nil
    lsp-ui-peek-enable nil
    lsp-ui-imenu-enable nil
    lsp-ui-doc-enable nil)
  )

(use-package helm-lsp :ensure t :commands helm-lsp-workspace-symbol)
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)

(provide 'module-lsp)
;;; module-lsp.el ends here

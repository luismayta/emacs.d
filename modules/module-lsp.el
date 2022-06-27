;;; module-lsp.el --- lsp config.
;;; code:
(require 'core-vars)

(use-package hydra)

;; optionally if you want to use debugger
(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
(use-package which-key
  :config
  (which-key-mode))

(use-package eglot
  :hook ((sh-mode js-mode rust-mode
                  svelte-mode typescript-mode python-mode) . eglot-ensure)
  :config
  (add-to-list 'eglot-server-programs '(rust-mode . ("rust-analyzer")))

  ;; cd ~/.nodebin
  ;; npm install typescript-language-server svelte-language-server
  (add-to-list 'eglot-server-programs '(typescript-mode . ("typescript-language-server" "--stdio")))
  ;;(add-to-list 'eglot-server-programs '(svelte-mode . ("svelteserver")))
  (add-to-list 'eglot-server-programs '(python-mode . ("pyls"))))

(use-package lsp-mode
  :requires hydra helm helm-lsp
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
    (setq lsp-prefer-flymake nil) ;; Prefer using lsp-ui (flycheck) over flymake.

    ;; don't set flymake or lsp-ui so the default linter doesn't get trampled
    (setq lsp-diagnostic-package :none)
    )
  (evil-leader/set-key
    "jd"  #'lsp-goto-type-definition ; (j)ump to (d)efinition
    "jb"  #'xref-pop-marker-stack)  ; (j)ump (b)ack to marker
  :hook (
          (lsp-mode . lsp-enable-which-key-integration)
          ((js2-mode rjsx-mode typescript-mode) . lsp-deferred) ;; https://www.chadstovern.com/javascript-in-emacs-revisited/
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
  :requires lsp-mode flycheck
  :config
  (setq lsp-ui-doc-enable t
    lsp-ui-imenu-enable nil
    ;; lsp-ui-doc-include-signature t
    lsp-ui-doc-position 'top
    lsp-ui-doc-use-childframe t
    lsp-ui-flycheck-enable t
    lsp-ui-flycheck-list-position 'right
    lsp-ui-flycheck-live-reporting t
    lsp-ui-peek-enable t
    lsp-ui-peek-list-width 60
    lsp-ui-sideline-enable t
    lsp-ui-sideline-enable nil
    lsp-ui-peek-peek-height 25)
  )

(use-package helm-lsp :ensure t :commands helm-lsp-workspace-symbol)

(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)

(provide 'module-lsp)
;;; module-lsp.el ends here

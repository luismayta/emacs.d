;;; module-web.el --- web related coding configuration.

(use-package web-mode
  :ensure t
  :ensure-system-package
  (
    (html-languageserver . "yarn global add vscode-html-languageserver-bin")
    )
  :init
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.ts[x]\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  :hook
  (web-mode . lsp-deferred)
  :config
  (setq web-mode-enable-current-element-highlight t))

;; Enable eslint checker for web-mode
; (flycheck-add-mode 'javascript-eslint 'web-mode)
;; Enable flycheck globally
(add-hook 'after-init-hook #'global-flycheck-mode)

(use-package scss-mode
  :requires (aggressive-indent)
  :ensure t
  :config
  (autoload 'scss-mode "scss-mode")
  (setq scss-compile-at-save nil)
  (add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
  (add-to-list 'aggressive-indent-excluded-modes 'scss-mode))

(use-package sass-mode :mode "\\.sass\\'")

(use-package css-eldoc
  :ensure t
  :init (autoload 'turn-on-css-eldoc "css-eldoc")
  :config (add-hook 'css-mode-hook #'turn-on-css-eldoc))

(provide 'module-web)
;;; module-web.el ends here

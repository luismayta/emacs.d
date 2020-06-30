;;; module-rust.el --- Rust settings.
;;; code:

(use-package rust-mode
  :hook (rust-mode . lsp))

(use-package rust-mode
  :mode ("\\.rs\\'" . rust-mode)
  :hook electric-pair
  :config
  (setq rust-format-on-save t)
  )

(use-package lsp-rust
  :disabled
  :after lsp-mode
  :config
  (progn
    (setq lsp-rust-rls-command '("rustup" "run" "nightly" "rls"))
    (add-hook 'rust-mode-hook #'lsp)
    ))

(use-package company-racer
  :requires company
  :bind ("M-TAB" . company-complete)
  :config
  (setq company-tooltip-align-annotations t))

;(use-package flycheck-rust
;  :hook ((rust-mode . flycheck-mode)
;	        (flycheck-mode . flycheck-rust-setup)))

(use-package cargo
  :hook ((rust-mode . cargo-minor-mode)))

(use-package racer
  :hook ((racer-mode . eldoc-mode)
	        (racer-mode . company-mode)
	        (rust-mode . racer-mode))
  :bind (("M-." . racer-find-definition)))

(provide 'module-rust)
;;; module-rust.el ends here

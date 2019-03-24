;;; module-coding-rust.el --- Rust settings.
;;; code:

(use-package rust-mode
  :ensure t
  :defer t
  :config

  (use-package company-racer
    :ensure t)

  (use-package cargo
    :ensure t)

  (use-package flycheck-rust
    :ensure t
    :config
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

  (use-package racer
    :ensure t
    :config
    (add-hook 'rust-mode-hook #'racer-mode)
    (add-hook 'racer-mode-hook #'eldoc-mode)))

(provide 'module-coding-rust)
;;; module-coding-rust.el ends here

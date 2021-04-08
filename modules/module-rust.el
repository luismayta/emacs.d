;;; module-rust.el --- Rust settings.
;;; code:

(use-package rust-mode
  :hook (rust-mode . lsp)
  :ensure t
  :mode "\\.rs\\'"
  :config
  (add-hook 'rust-mode-hook (lambda ()
                              (local-set-key (kbd "C-c <tab>") #'rust-format-buffer))))

(use-package cargo
  :ensure t
  :hook (rust-mode . cargo-minor-mode))

(provide 'module-rust)
;;; module-rust.el ends here

;; yasnippet configuration.
;; code:
(use-package yasnippet
  :defer 2
  :init
  ;; Ensure custom snippets dir exists.
  (defvar custom-snippets-dir (core/emacs.d "snippets/"))
  (core/mkdir-p custom-snippets-dir)
  ;; Replace default custom dir with our own.
  (setq yas-snippet-dirs '(custom-snippets-dir
                            yas-installed-snippets-dir))
  ;; Suppress excessive log messages
  (setq yas-verbosity 1)
  :config
  (yas-global-mode t)
  ;; Remove Yasnippet's default tab key binding
  (define-key yas-minor-mode-map (kbd "<tab>") nil)
  (define-key yas-minor-mode-map (kbd "TAB") nil)
  ;; Set Yasnippet's key binding to shift+tab
  (define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand)
  ;; Alternatively use Control-c + tab
  (define-key yas-minor-mode-map (kbd "\C-c TAB") 'yas-expand)

  ;; Disable yasnippet in some modes.
  (defun yas-disable-hook ()
    (setq yas-dont-activate t))
  (add-hook 'term-mode-hook #'yas-disable-hook)
  (add-hook 'comint-mode-hook #'yas-disable-hook)
  (add-hook 'erc-mode-hook #'yas-disable-hook))

(provide 'module-snippets)

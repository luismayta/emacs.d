;;; lm-coding-web.el --- web related coding configuration.

(use-package php-mode
  :mode "\\.php[345]?\\'"
  :config
  (add-hook 'php-mode-hook #'ggtags-mode))

(use-package web-mode
  :mode (("\\.html\\'" . web-mode)
        ("\\.phtml\\'" . web-mode)
        ("\\.tpl\\'" . web-mode)
        ("\\.[agj]sp\\'" . web-mode)
        ("\\.as[cp]x\\'" . web-mode)
        ("\\.erb\\'" . web-mode)
        ("\\.mustache\\'" . web-mode)
        ("\\.djhtml\\'" . web-mode)
        ("\\.jade\\'" . web-mode)
        ("\\.json\\'" . web-mode)))

(provide 'lm-coding-web)

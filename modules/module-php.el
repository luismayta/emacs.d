;;; module-php.el --- Php settings.
;;; code:

(use-package php-mode
  :mode  (("\\.phtml" . php-mode)
           ("\\.php" . php-mode)
           ("\\.inc" . php-mode))
  :commands php-mode
  :ensure php-mode
  :ensure-system-package
  (
    (prettier . "yarn global add intelephense")
    )
  :hook
  (php-mode . lsp-deferred)
  )

(use-package phpunit
 :ensure t)

(provide 'module-php)
;;; module-php.el ends here

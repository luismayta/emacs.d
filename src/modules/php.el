;;; module/php.el --- Php settings.
;;; code:

(use-package php-mode
  :mode  (("\\.phtml" . php-mode)
           ("\\.php" . php-mode)
           ("\\.inc" . php-mode))
  :commands php-mode
  :ensure php-mode
  )
;; :config
;; (add-hook 'php-mode-hook #'ggtags-mode))

;; company-php
(use-package company-php)

(provide 'module/php)
;;; module/php.el ends here

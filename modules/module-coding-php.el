;;; module-coding-php.el --- Php settings.
;;; code:

(use-package php-mode
  :commands php-mode
  :ensure php-mode
  :config
  (add-hook 'php-mode-hook #'ggtags-mode)
  :mode
  (("\\.phtml\\" . php-mode)
    ("\\.php[345]?\\" . php-mode)
    ("\\.php\\" . php-mode)
    ("\\.inc\\" . php-mode)))

;; company-php
(use-package company-php)

(provide 'module-coding-php)

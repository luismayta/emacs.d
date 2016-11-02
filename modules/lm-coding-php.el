;;; lm-coding-php.el --- Php settings.
;;; code:

(use-package php-mode
  :commands php-mode
  :ensure php-mode
  :mode
  (("\\.phtml\\" . php-mode)
    ("\\.php\\" . php-mode)
    ("\\.inc\\" . php-mode)))

;; company-php
(use-package company-php)

(provide 'lm-coding-php)

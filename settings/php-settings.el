;; Install Packages
;;; code:

(package-require 'php-mode)

(require 'php-mode)

;; make php-mode indentation vaguely sane
(add-hook 'php-mode-hook
  (lambda ()
    (set (make-local-variable 'tab-stop-list) (number-sequence 4 200 4))
    (c-set-offset 'substatement-open 0)))

(provide 'php-settings)

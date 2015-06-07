;; Install Packages

(bundle 'php-mode nil)

;; Config

(require 'php-mode)

;; make php-mode indentation vaguely sane
(add-hook 'php-mode-hook
  (lambda ()
    (setq indent-tabs-mode t)
    (setq tab-width 4)
    (setq evil-shift-width 4)
    (set (make-local-variable 'tab-stop-list) (number-sequence 4 200 4))
    (c-set-offset 'substatement-open 0)))

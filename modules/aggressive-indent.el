;; Install Packages
;;; code:
(package-require 'aggressive-indent)
(require 'aggressive-indent)

(global-aggressive-indent-mode 1)
(add-to-list 'aggressive-indent-excluded-modes 'html-mode)

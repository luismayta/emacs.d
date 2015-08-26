;; Install Packages
(bundle 'aggressive-indent nil)
(require 'aggressive-indent)

(global-aggressive-indent-mode 1)
(add-to-list 'aggressive-indent-excluded-modes 'html-mode)

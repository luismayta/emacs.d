;----------------------------------;
;;;    Smartparens Settings      ;;;
;----------------------------------;

;; Install Packages
(bundle 'smartparens nil)

(require 'smartparens)

(smartparens-global-mode)
(show-smartparens-global-mode t)

(provide 'smartparens-settings)

;----------------------------------;
;;;    Smartparens Settings      ;;;
;----------------------------------;

;; Install Packages
(el-get-install 'smartparens nil)

(require 'smartparens)

(require 'smartparens-config)
(require 'smartparens-ruby)
(smartparens-global-mode)
(show-smartparens-global-mode t)

(provide 'smartparens-settings)

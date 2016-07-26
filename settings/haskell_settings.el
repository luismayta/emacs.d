;------------------------------;
;;;    Haskell Settings      ;;;
;------------------------------;

;; Install Packages
(bundle 'haskell-mode nil)

(require 'haskell-mode)
(require 'hindent)

(add-hook 'haskell-mode-hook #'hindent-mode)

(provide 'haskell-settings)

;------------------------------;
;;;    Haskell Settings      ;;;
;------------------------------;

;;; code:
(package-require 'haskell-mode)

(require 'haskell-mode)
(require 'hindent)

(add-hook 'haskell-mode-hook #'hindent-mode)

(provide 'haskell-settings)

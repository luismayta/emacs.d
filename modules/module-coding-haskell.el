;;; module-coding-haskell.el --- Code haskell.
;;; code:

(require 'core-vars)

(use-package haskell-mode
  :mode  (("\\.hs" . haskell-mode))
  :commands haskell-mode
  :init
  (add-hook 'haskell-mode-hook #'hindent-mode))

(provide 'module-coding-haskell)
;;; module-coding-haskell.el ends here

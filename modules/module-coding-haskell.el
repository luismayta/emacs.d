;;; module-coding-haskell.el --- Code haskell.
;;; code:

(use-package haskell-mode
  :commands haskell-mode
  :ensure ggtags
  :init
  (add-hook 'haskell-mode-hook #'hindent-mode))

(provide 'module-coding-haskell)

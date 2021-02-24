;;; module/tags.el --- Display and appearance related settings.

;;; code:

(use-package counsel-gtags
  :requires (evil-leader)
  :diminish counsel-gtags-mode
  :init
  (evil-leader/set-key "tt" 'counsel-gtags-find-tag)
  (evil-leader/set-key "tc" 'counsel-gtags-update-tags)
  (add-hook 'prog-mode-hook 'counsel-gtags-mode)
  (add-hook 'before-save-hook 'counsel-gtags-update-tags)
  )

(use-package ggtags
  :ensure t
  :defer
  :diminish
  ggtags-mode
  :requires (evil-leader)
  :init
  (evil-leader/set-key
    "ft" 'ggtags-find-tag-dwim
    "fr" 'ggtags-find-reference
    "fd" 'ggtags-find-definition
    "fc" 'ggtags-find-tag-continue)
  :commands
  ggtags-find-tag-dwim
  ggtags-find-reference
  ggtags-find-definition
  ggtags-find-tag-continue)

(provide 'module/tags)
;;; module/tags.el ends here

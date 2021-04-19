;; yasnippet configuration.
;; code:

(use-package yasnippet
  :ensure t
  :delight (yas-minor-mode  "Ⓨ")
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure t
  :after yasnippet)

;; Integrate yasnippet
(use-package ivy-yasnippet
  :after yasnippet
  :commands ivy-yasnippet--preview
  :bind (
          ("C-c C-y" . ivy-yasnippet)
          ("C-<tab>" . ivy-yasnippet)
          )
  :config (advice-add #'ivy-yasnippet--preview :override #'ignore))


(provide 'module-snippets)
;;; module-snippets.el ends here

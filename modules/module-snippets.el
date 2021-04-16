;; yasnippet configuration.
;; code:

(use-package yasnippet
  :commands yas-reload-all
  :hook ((prog-mode LaTeX-mode) . yas-minor-mode)
  :diminish (yas-minor-mode . "y")
  :init
  (push 'company-yasnippet core-company-global-backends)
  (define-key evil-insert-state-map (kbd "C-SPC") 'yas-expand)
  (core-leader ("ty" 'yas-minor-mode "Toggle yasnippet"))
  :config
  (yas-reload-all))

(use-package yasnippet-snippets
  :ensure t
  :after yasnipet
  )

(use-package js-react-redux-yasnippets
  :ensure t)

(use-package react-snippets
  :ensure t)

(use-package company-yasnippet
  :ensure company
  :after yasnippet
  :commands company-yasnippet
  )

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

;; yasnippet configuration.
;; code:
(use-package yasnippet
  :ensure t
  :init
  ;; Ensure custom snippets dir exists.
  (defvar custom-snippets-dir (core-emacs.d "snippets/"))
  (core-mkdir-p custom-snippets-dir)
  ;; Replace default custom dir with our own.
  (setq yas-snippet-dirs '(custom-snippets-dir
                            yas-installed-snippets-dir))
  ;; Suppress excessive log messages
  (setq yas-verbosity 1)
  :bind
  (:map yas-minor-mode-map
    ("<tab>" . nil)
    ("TAB" . nil)
    )
  :config
  (yas-global-mode)
  (define-key yas-minor-mode-map (kbd "C-<tab>") 'yas-expand)
  (define-key yas-minor-mode-map (kbd "<tab>") nil)
  (define-key yas-minor-mode-map (kbd "TAB") nil)
  ;; Disable yasnippet in some modes.
  (defun yas-disable-hook ()
    (setq yas-dont-activate 1))

  (add-hook 'term-mode-hook #'yas-disable-hook)
  (add-hook 'comint-mode-hook #'yas-disable-hook)
  (add-hook 'erc-mode-hook #'yas-disable-hook)

  (defun expand-for-web-mode ()
    (when (equal mode-name "Web")
      (make-local-variable 'yas-extra-modes)
      (setq yas-extra-modes
        (let ((web-lang (web-mode-language-at-pos)))
          (cond
            ((equal web-lang "html")       '(html-mode))
            ((equal web-lang "css")        '(css-mode))
            ((equal web-lang "javascript") '(javascript-mode))
            )))))

  (add-hook 'yas-before-expand-snippet-hook 'expand-for-web-mode)
  )

(use-package yasnippet-snippets
  :ensure t
  :after yasnipet
  )

(use-package js-react-redux-yasnippets
  :ensure t)

(use-package react-snippets
  :ensure t)

(use-package auto-yasnippet
  :ensure t
  :after yasnippet
  :commands
  (aya-create
    aya-expand
    aya-open-line)
  )

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

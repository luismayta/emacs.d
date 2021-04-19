;;; module-general.el --- General coding-related config.
;;; code:
(use-package tramp
  :init
  (setq tramp-default-method "ssh")
  :config
  (with-eval-after-load 'tramp '(setenv "SHELL" "/bin/bash")))

;; EditorConfig.org -- project-local coding style definitions.
(use-package editorconfig
  :commands editorconfig-mode
  :init (add-hook 'prog-mode-hook #'editorconfig-mode)
  :config
  (progn
    (add-to-list 'editorconfig-indentation-alist
      '(swift-mode swift-indent-offset))))

(use-package feature-mode
  :mode (("\\.feature$" . feature-mode)))

(use-package goto-last-change)

;; flycheck
(use-package flycheck
  :commands flycheck-mode
  :diminish " ✓"
  :init (add-hook 'prog-mode-hook #'flycheck-mode)
  :config (setq flycheck-emacs-lisp-load-path 'inherit))

;; yaml
(use-package yaml-mode
  :mode
  ((("\\.yml$" . yaml-mode)
     ("\\.yaml$" . yaml-mode))))

;; toml
(use-package toml-mode
  :straight (toml-mode :type git :host github :repo "dryman/toml-mode.el")
  :mode ("\\.toml\\'" "Pipfile\\'" "\\Cargo.lock\\'" "\\.cargo/config\\'"))

(use-package emmet-mode
  :ensure t
  :hook ((css-mode . emmet-mode)
          (php-mode . emmet-mode)
          (sgnl-mode . emmet-mode)
          (rjsx-mode . emmet-mode)
          (html-mode . emmet-mode)
          (web-mode . emmet-mode)))

(use-package wakatime-mode
  :ensure t
  :defer t
  :diminish wakatime-mode
  :init (add-hook 'after-init-hook 'global-wakatime-mode))

(use-package plantuml-mode
  :requires (evil-leader)
  :mode (("\\.puml$" . plantuml-mode)
          ("\\.plantuml$" . plantuml-mode))
  :config
  (setq plantuml-jar-path (getenv "PLANTUML_JAR_PATH"))
  :init
  (evil-leader/set-key "pu" 'plantuml-preview))

(use-package restart-emacs)

(use-package dashboard
  :ensure t
  :init
  (setq
    dashboard-banner-logo-title ""
    dashboard-startup-banner nil
    dashboard-items '((recents  . 10)
                       (projects . 10)))
  (setq dashboard-set-footer nil)
  :config
  (dashboard-setup-startup-hook))

(use-package general
  :config
  (setq general-override-states '(normal visual motion))
  (general-override-mode))

(provide 'module-general)
;;; module-general.el ends here

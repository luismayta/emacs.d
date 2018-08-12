;;; module-ui.el --- UI niceties.

;; uniquify
;; Overrides Emacs' default mechanism for making buffer names unique.
(use-package uniquify
  :ensure nil
  :config (setq uniquify-buffer-name-style 'forward))


;; ido
(use-package ido
  :ensure flx-ido
  :ensure ido-ubiquitous
  :init (ido-mode 1)
  :config
  (use-package ido-vertical-mode
    :config
    (setq ido-vertical-define-keys 'C-n-and-C-p-only))
  (add-to-list 'ido-ignore-files "\\.DS_Store")
  (setq ido-enable-flex-matching t
    ido-ignore-buffers  '("\\` "  "^\*Back" ".*Completions\*" "^\*Ido" "^\*trace"
                           "^\*compilation" "^\*GTAGS" "^session\.*")
    ido-enable-prefix nil
    ido-use-url-at-point nil
    ido-max-prospects 10
    ido-use-faces nil
    flx-ido-use-faces t)
  (ido-everywhere 1)
  (ido-vertical-mode 1)
  (flx-ido-mode 1))

;; smex
(use-package smex
  :bind (("M-x" . smex)
          ("M-X" . smex-major-mode-commands)
          ("C-x C-m" . smex)
          ("C-c C-m" . smex))
  :init (setq smex-save-file (core/cache-for "smex-items"))
  :config (smex-initialize))

;; diminish some modes.
(use-package simple
  :ensure nil
  :diminish visual-line-mode)

;; get rid of the mouse.
(use-package avoid
  :if window-system
  :defer 10
  :config
  (mouse-avoidance-mode 'exile))

(use-package treemacs
  :ensure t
  :config
  (progn
    (setq treemacs-follow-after-init          t
      treemacs-width                      30
      treemacs-indentation                2
      treemacs-git-integration            t
      treemacs-collapse-dirs              3
      treemacs-silent-refresh             nil
      treemacs-change-root-without-asking nil
      treemacs-sorting                    'alphabetic-desc
      treemacs-show-hidden-files          t
      treemacs-never-persist              nil
      treemacs-is-never-other-window      nil
      treemacs-goto-tag-strategy          'refetch-index)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t))
  :bind
  (:map global-map
    ([f8]        . treemacs-toggle)
    ("M-0"       . treemacs-select-window)
    ("C-c 1"     . treemacs-delete-other-windows)
    ("C-c tt"    . treemacs-toggle)
    ("C-c tT"    . treemacs)
    ("C-c t C-t" . treemacs-find-file))
  :init
  (evil-leader/set-key "n" 'treemacs-find-file)
  )

(use-package treemacs-projectile
  :ensure t
  :config
  (setq treemacs-header-function #'treemacs-projectile-create-header)
  :bind (:map global-map
          ("C-c tp" . treemacs-projectile)
          ("C-c tP" . treemacs-projectile-toggle))
  :init
  (evil-leader/set-key "fsp" 'treemacs-projectile)
  )

(provide 'module-ui)
;;; module-ui.el ends here

;;; Evil --- Settings emacs
;;; comentary:
;;; Configure evil mode and its packages - VIM like performance
;;; code:
(use-package evil
  :ensure t
  :init
  ;; anzu tells us how many matches we have in the bar
  (use-package anzu
    :ensure t
    :diminish anzu-mode
    :config
    (global-anzu-mode 1))
  ;; improved code folding - like vim
  (use-package evil-vimish-fold
    :ensure	vimish-fold
    :diminish ""
    :ensure t
    :config
    (add-hook 'after-init-hook #'evil-vimish-fold-mode))
  (use-package evil-snipe
    :ensure t
    :diminish evil-snipe-mode
    :diminish evil-snipe-override-mode
    :diminish evil-snipe-local-mode
    :config
    (evil-snipe-override-mode 1)
    (setq evil-snipe-scope 'whole-visible
      evil-snipe-spillover-scope 'whole-buffer
      evil-snipe-auto-scroll 'nil))
  (use-package evil-surround
    :ensure t
    :init
    (use-package evil-embrace
      :ensure t
      :config
      (evil-embrace-enable-evil-surround-integration)
      (add-hook 'LaTeX-mode-hook #'embrace-LaTeX-mode-hook)
      (add-hook 'org-mode-hook #'embrace-org-mode-hook))
    :config
    (global-evil-surround-mode 1))
  (use-package evil-commentary
    :ensure t
    :diminish ""
    :config
    (evil-commentary-mode))
  (setq evil-snipe-scope 'visible)
  (use-package evil-exchange
    :ensure t
    :config
    (evil-exchange-install))
  (use-package evil-visualstar
    :ensure t
    :config
    (global-evil-visualstar-mode))
  (use-package evil-numbers
    :ensure t)
  (use-package evil-matchit
    :ensure t
    :config
    (global-evil-matchit-mode 1))
  (use-package evil-args
    :ensure t
    :config
    ;; bind evil-args text objects
    (define-key evil-inner-text-objects-map "a" 'evil-inner-arg)
    (define-key evil-outer-text-objects-map "a" 'evil-outer-arg)
    ;; bind evil-forward/backward-args
    (define-key evil-normal-state-map "L" 'evil-forward-arg)
    (define-key evil-normal-state-map "H" 'evil-backward-arg)
    (define-key evil-motion-state-map "L" 'evil-forward-arg)
    (define-key evil-motion-state-map "H" 'evil-backward-arg)
    ;; bind evil-jump-out-args
    (define-key evil-normal-state-map "K" 'evil-jump-out-args))
  (use-package evil-indent-plus
    :ensure t
    :config
    (define-key evil-inner-text-objects-map "i" 'evil-indent-plus-i-indent)
    (define-key evil-outer-text-objects-map "i" 'evil-indent-plus-a-indent)
    (define-key evil-inner-text-objects-map "I" 'evil-indent-plus-i-indent-up)
    (define-key evil-outer-text-objects-map "I" 'evil-indent-plus-a-indent-up)
    (define-key evil-inner-text-objects-map "J" 'evil-indent-plus-i-indent-up-down)
    (define-key evil-outer-text-objects-map "J" 'evil-indent-plus-a-indent-up-down))
  (use-package evil-lion
    :ensure t
    :config
    (evil-lion-mode))
  (use-package evil-search-highlight-persist
    :ensure t
    :diminish ""
    :config
    (global-evil-search-highlight-persist t)
    (setq evil-search-highlight-string-min-len 3))
  (use-package evil-easymotion
    :ensure t
    :config
    (evilem-default-keybindings "gs"))
  (use-package evil-rsi
    :ensure t
    :diminish ""
    :config
    (add-hook 'after-init-hook #'evil-rsi-mode))
  (use-package evil-multiedit
    :ensure t
    :config
    (setq evil-multiedit-scope 'buffer
      evil-multiedit-follow-matches t))
  (use-package evil-mc
    :ensure t
    :diminish ""
    :init
    (use-package evil-mc-extras
      :ensure t
      :diminish	""
      :config
      (global-evil-mc-extras-mode  1))
    :config
    (global-evil-mc-mode  1))
  (use-package evil-lispy
    :ensure t)
  (use-package evil-leader
    :init (global-evil-leader-mode)
    :config
    (progn
      (evil-leader/set-leader ",")
      (setq evil-leader/in-all-states 1)
      ;; keyboard shortcuts
      (evil-leader/set-key
        "u" 'undo-tree-visualize
        "c" 'evil-commentary-line
        "fa" 'origami-toggle-all-nodes
        "fr" 'origami-recursively-toggle-node
        "fe" 'find-file
        "ff" 'counsel-projectile-ag
        "fp" 'counsel-projectile-find-file
        "fm" 'fixmee-view-listing
        "gs" 'magit-status
        "gc" 'magit-commit
        "gd" 'magit-diff
        "gl" 'gist-list
        "gb" 'gist-buffer
        "b" 'ido-switch-buffer
        "s" 'save-buffer
        "k" 'ido-kill-buffer
        "xx" 'er/expand-region
        "/" 'counsel-grep
        )))
  :config
  (evil-mode 1)
  (setq evil-want-C-u-scroll t
    evil-want-visual-char-semi-exclusive t
    evil-want-Y-yank-to-eol t
    evil-magic t
    evil-echo-state t
    evil-indent-convert-tabs t
    evil-ex-search-vim-style-regexp t
    evil-ex-substitute-global t
    evil-ex-visual-char-range t  ; column range for ex commands
    evil-insert-skip-empty-lines t
    evil-mode-line-format 'nil
    ;; more vim-like behavior
    evil-symbol-word-search t
    ;; don't activate mark on shift-click
    shift-select-mode nil))

(use-package god-mode
  :ensure t
  :init
  (use-package evil-god-state
    :ensure t))

(provide 'module-coding-evil)
;;; module-coding-evil.el ends here

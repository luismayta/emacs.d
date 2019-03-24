;;; Evil --- Settings emacs
;;; comentary:
;;; Configure evil mode and its packages - VIM like performance
;;; code:

;; The definition of evil-escape-mode.
(define-minor-mode evil-escape-mode
  (if evil-escape-mode
    (add-hook 'pre-command-hook 'evil-escape-pre-command-hook)
    (remove-hook 'pre-command-hook 'evil-escape-pre-command-hook)))

;; Before:
(evil-escape-mode)

;; After:
(use-package evil-escape
  :defer t
  ;; Only needed for functions without an autoload comment (;;;###autoload).
  :commands (evil-escape-pre-command-hook)

  ;; Adding to a hook won't load the function until we invoke it.
  ;; With pre-command-hook, that means the first command we run will
  ;; load evil-escape.
  :init (add-hook 'pre-command-hook 'evil-escape-pre-command-hook))

(use-package evil
  :ensure t
  :init
  ;; anzu tells us how many matches we have in the bar
  (use-package evil-commentary
    :ensure t
    :diminish ""
    :config
    (evil-commentary-mode))
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
  (use-package evil-leader
    :init
    (global-evil-leader-mode)
    :config
    (progn
      (evil-leader/set-leader ",")
      (setq evil-leader/in-all-states 1)
      ;; keyboard shortcuts
      (evil-leader/set-key
        "c" 'evil-commentary-line
        ;"fm" 'fixmee-view-listing
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

(provide 'module-coding-evil)
;;; module-coding-evil.el ends here

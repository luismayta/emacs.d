;;; Evil --- Settings emacs
;;; comentary:
;;; Configure evil mode and its packages - VIM like performance
;;; code:

(use-package evil-leader
  :init
  (setq evil-want-keybinding nil) ;; required for evil-collection
  :config
  (global-evil-leader-mode t)
  )

(use-package evil
  :requires (evil-leader)
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
  (evil-mode t)
  (evil-set-initial-state 'term-mode 'emacs)
  (evil-leader/set-leader ",")
  (evil-leader/set-key
    "s" 'save-buffer)
  (define-key evil-insert-state-map (kbd "C-c") 'evil-normal-state)
  ;; Ignore EOF in visual mode
  (define-key evil-visual-state-map (kbd "h") 'backward-char)
  (define-key evil-visual-state-map (kbd "l") 'forward-char)
  ;; Disable mouse scrollling in insert mode
  (add-hook 'evil-insert-state-entry-hook (lambda() (mouse-wheel-mode -1)))
  (add-hook 'evil-insert-state-exit-hook 'mouse-wheel-mode -1)
  (add-hook 'evil-insert-state-exit-hook 'core-save-if-bufferfilename)
  ;; Treat underscore as a part of the word
  (add-hook 'evil-normal-state-entry-hook (lambda() (modify-syntax-entry ?_  "w")))
  )

(with-eval-after-load 'evil
  (defalias #'forward-evil-word #'forward-evil-symbol))


(use-package evil-ex-fasd
  :after evil
  :config
  ;; :[w]q should kill the current buffer rather than quitting emacs entirely
  (evil-ex-define-cmd "[w]q" 'kill-this-buffer)
  ;; Need to type out :quit to close emacs
  (evil-ex-define-cmd "quit" 'evil-quit)
  )

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package evil-commentary
  :requires (evil-leader)
  :after evil
  :ensure t
  :diminish ""
  :init
  (evil-leader/set-key "c" 'evil-commentary-line)
  :config
  (evil-commentary-mode))

(use-package evil-numbers
  :after evil
  :ensure t)

(use-package evil-matchit
  :after evil
  :ensure t
  :config
  (global-evil-matchit-mode 1))

(use-package evil-args
  :after evil
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
  :after evil
  :ensure t
  :diminish ""
  :config
  (global-evil-search-highlight-persist t)
  (setq evil-search-highlight-string-min-len 3))

(use-package evil-easymotion
  :after evil
  :ensure t
  :config
  (evilem-default-keybindings "gs"))

(use-package evil-rsi
  :after evil
  :ensure t
  :diminish ""
  :config
  (add-hook 'after-init-hook #'evil-rsi-mode))

(use-package evil-multiedit
  :after evil
  :ensure t
  :config
  (setq evil-multiedit-scope 'buffer
    evil-multiedit-follow-matches t))

(provide 'module-evil)
;;; module-evil.el ends here

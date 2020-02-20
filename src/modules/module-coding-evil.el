;;; Evil --- Settings emacs
;;; comentary:
;;; Configure evil mode and its packages - VIM like performance
;;; code:

(require 'core-defuns)

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

(use-package evil-leader
  :config
  (global-evil-leader-mode t)
  )

(use-package evil
  :init
  (setq evil-want-integration t)
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
  (add-hook 'evil-insert-state-exit-hook 'core/save-if-bufferfilename)
  ;; Treat underscore as a part of the word
  (add-hook 'evil-normal-state-entry-hook (lambda() (modify-syntax-entry ?_  "w")))
  )

(with-eval-after-load 'evil
  (defalias #'forward-evil-word #'forward-evil-symbol))

;; :[w]q should kill the current buffer rather than quitting emacs entirely
(evil-ex-define-cmd "[w]q" 'kill-this-buffer)
;; Need to type out :quit to close emacs
(evil-ex-define-cmd "quit" 'evil-quit)

;; (use-package evil-leader
;;   :init
;;   (global-evil-leader-mode)
;;   :config
;;   (progn
;;     (evil-leader/set-leader ",")
;;     (setq evil-leader/in-all-states 1)
;;     ;; keyboard shortcuts
;;     (evil-leader/set-key
;;       "c" 'evil-commentary-line
;;                                         ;"fm" 'fixmee-view-listing
;;       "gl" 'gist-list
;;       "gb" 'gist-buffer
;;       "b" 'ido-switch-buffer
;;       "s" 'save-buffer
;;       "k" 'ido-kill-buffer
;;       "xx" 'er/expand-region
;;       "/" 'counsel-grep
;; )))

;; (with-eval-after-load 'evil
;;   (defalias #'forward-evil-word #'forward-evil-symbol))

;; (use-package evil
;;   :requires (evil-leader dashboard)
;;   :init
;;   (setq evil-want-integration t)
;;   (setq evil-want-keybinding nil)
;;   (add-hook 'emacs-startup-hook (lambda()
;;                                   (evil-mode 1)
;;                                   ))
;;   :config
;;   (evil-mode 1)
;;   (turn-on-evil-mode)
;;   (define-key evil-insert-state-map (kbd "<tab>") 'hippie-expand)
;;   (add-hook 'git-commit-mode-hook 'evil-insert-state)
;;   (evil-set-initial-state 'dashboard-mode 'emacs)
;;   (eval-after-load 'git-timemachine
;;     '(progn
;;        (evil-make-overriding-map git-timemachine-mode-map 'normal)
;; (add-hook 'git-timemachine-mode-hook #'evil-normalize-keymaps))))

(use-package evil-collection
  :requires (evil)
  :after evil
  :custom (evil-collection-setup-minibuffer t)
  :config
  (evil-collection-init))

(use-package evil-commentary
  :requires (evil)
  :after evil
  :ensure t
  :diminish ""
  :init
  (evil-leader/set-key "c" 'evil-commentary-line)
  :config
  (evil-commentary-mode))

(use-package evil-numbers
  :requires (evil)
  :ensure t)

(use-package evil-matchit
  :requires (evil)
  :ensure t
  :config
  (global-evil-matchit-mode 1))

(use-package evil-args
  :requires (evil)
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
  :requires (evil)
  :ensure t
  :diminish ""
  :config
  (global-evil-search-highlight-persist t)
  (setq evil-search-highlight-string-min-len 3))

(use-package evil-easymotion
  :requires (evil)
  :ensure t
  :config
  (evilem-default-keybindings "gs"))

(use-package evil-rsi
  :requires (evil)
  :ensure t
  :diminish ""
  :config
  (add-hook 'after-init-hook #'evil-rsi-mode))

(use-package evil-multiedit
  :requires (evil)
  :ensure t
  :config
  (setq evil-multiedit-scope 'buffer
    evil-multiedit-follow-matches t))


(provide 'module-coding-evil)
;;; module-coding-evil.el ends here

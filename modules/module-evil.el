;;; Evil --- Settings emacs
;;; comentary:
;;; Configure evil mode and its packages - VIM like performance
;;; code:

(require 'core-vars)
(require 'core-functions)

(use-package evil-leader
  :ensure t
  :init
  (setq evil-want-keybinding nil) ;; required for evil-collection
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader core-leader-key)
  (evil-leader/set-key
    "s" 'save-buffer
    "e" 'ido-find-file
    "b" 'switch-to-buffer
    "k" 'kill-buffer
    )
  )

(use-package evil
  :ensure t
  :requires (evil-leader)
  :after evil-collection
  :init
  (setq evil-normal-state-cursor  '("DarkGoldenrod2" box)
    evil-insert-state-cursor  '("chartreuse3" (bar . 2))
    evil-emacs-state-cursor   '("SkyBlue2" box)
    evil-replace-state-cursor '("red" (hbar . 2))
    evil-visual-state-cursor  '("gray" (hbar . 2))
    evil-motion-state-cursor  '("plum3" box)
    evil-want-integration     t
    evil-want-C-u-scroll      t
    ;; evil-undo-system          'undo-tree
    )
  :config
  (evil-mode 1))

(with-eval-after-load 'evil
  (defalias #'forward-evil-word #'forward-evil-symbol))

(use-package evil-ex-fasd
  :after evil
  :straight (evil-ex-fasd :type git :host github :repo "yqrashawn/evil-ex-fasd") ; not found in melpa
  :config
  ;; :[w]q should kill the current buffer rather than quitting emacs entirely
  (evil-ex-define-cmd "[w]q" 'kill-this-buffer)
  ;; Need to type out :quit to close emacs
  (evil-ex-define-cmd "quit" 'evil-quit)
  )

(use-package evil-collection
  :after evil-leader
  :custom
  (evil-collection-company-use-tng nil)
  :config
  (evil-collection-init))

(use-package evil-commentary
  :requires (evil-leader)
  :after evil
  :ensure t
  :diminish ""
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

(use-package evil-multiedit
  :after evil
  :ensure t
  :config
  (setq evil-multiedit-scope 'buffer
    evil-multiedit-follow-matches t))

(use-package evil-escape
  :ensure t
  :init
  (setq-default evil-escape-key-sequence "jk")
  (setq-default evil-escape-delay 0.2)
  :config
  (evil-escape-mode))

(provide 'module-evil)
;;; module-evil.el ends here

;; Delete marked text on typing
;;; code:

(use-package atomic-chrome
  :config
  (atomic-chrome-start-server)
  (setq atomic-chrome-default-major-mode 'gfm-mode)
  )

;; simpleclip
(use-package simpleclip
  :config
  (simpleclip-mode 1)
  (setq interprogram-cut-function   'simpleclip-set-contents)
  (setq interprogram-paste-function 'simpleclip-get-contents))

;; Revert buffers automatically when underlying files are changed externally.
(use-package autorevert
  :diminish auto-revert-mode
  :config
  (global-auto-revert-mode t))

;; Crux (Collection of Ridiculously Useful eXtensions)
;; Replaces a lot of my old defuns and bindings.
(use-package crux
  :requires (evil-leader)
  :bind (("C-x C-r" . crux-recentf-find-file)
          ("C-a" . crux-move-beginning-of-line)
          ("<S-return>" . crux-smart-open-line)
          ("C-c R" . crux-rename-buffer-and-file)
          ("C-c D" . crux-delete-buffer-and-file)
          ("<f2>" . crux-visit-term-buffer)
          ("s-j" . crux-top-join-line))
  :init
  (evil-leader/set-key "fx" 'crux-recentf-find-file)
  :config (recentf-mode t))

;; Use conf-mode where appropriate.
(use-package conf-mode
  :mode (("\\.editorconfig$" . conf-mode)
          ("\\.conf" . conf-mode)
          ("\\.cnf" . conf-mode)
          ("\\.cfg" . conf-mode)
          ("\\.env" . conf-mode)
          ("\\.ini" . conf-mode)))

;; multiple-cursors
(use-package multiple-cursors
  :init (setq mc/list-file (core/emacs.d "etc/.mc-lists.el"))
  :bind (("C->" . mc/mark-next-like-this)
          ("C-<" . mc/mark-previous-like-this)
          ("C-c C->" . mc/mark-all-like-this)))

;; expand-region
(use-package expand-region
   :requires (evil-leader)
  :init
  (evil-leader/set-key "xx" 'er/expand-region)
  :bind ("C-=" . er/expand-region))

;; keeps our parentheses balanced and allows for easy manipulation
(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :init
  (use-package evil-smartparens
    :ensure t
    :diminish evil-smartparens-mode
    :config
    (add-hook 'clojure-mode-hook #'evil-smartparens-mode)
    (add-hook 'lisp-mode-hook #'evil-smartparens-mode)
    (add-hook 'scheme-mode-hook #'evil-smartparens-mode)
    (add-hook 'emacs-lisp-mode-hook #'evil-smartparens-mode))
  :config
  (require 'smartparens-config)
  (add-hook 'after-init-hook 'smartparens-global-mode))

;; browse-kill-ring
(use-package browse-kill-ring
  :bind ("M-y" . browse-kill-ring))

;; intelligently cleanup whitespace on save
(use-package whitespace-cleanup-mode
  :ensure t
  :diminish whitespace-cleanup-mode
  :config
  (add-hook 'after-init-hook 'whitespace-cleanup-mode)
  (add-hook 'before-save-hook 'whitespace-cleanup-mode))

;; subword
(use-package subword
  :diminish subword-mode
  :init (global-subword-mode))

;; undo-tree
;; Treat undo history as a tree.
(use-package undo-tree
   :requires (evil-leader)
  :diminish undo-tree-mode
  :bind ("C-x u" . undo-tree-visualize)
  :init
  (evil-leader/set-key "u" 'undo-tree-visualize)
  :config
  (global-undo-tree-mode)
  (setq undo-tree-visualizer-timestamps t)
  (setq undo-tree-visualizer-diff t))

;; embrace
;; Add/Change/Delete pairs based on expand-region.
(use-package embrace
  :bind ("C-," . embrace-commander))

;; aggressive-indent
;; amazing plugin - gives us perfect indentation automatically for code
(use-package aggressive-indent
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'aggressive-indent-global-mode)
  (defvar aggressive-indent/excluded '())
  (setq aggressive-indent/excluded '(php-mode rst-mode html-mode ruby-mode python-mode yaml-mode haskell-mode))
  (dolist (item aggressive-indent/excluded)
    (add-to-list 'aggressive-indent-excluded-modes item)))

(use-package systemd
  :ensure t)

(use-package visual-fill-column
  :ensure t)

(provide 'module-editing)
;;; module-editing.el ends here

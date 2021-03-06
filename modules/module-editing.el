;; Delete marked text on typing
;;; code:

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
  :init (setq mc/list-file (core-emacs.d "etc/.mc-lists.el"))
  :bind (("C->" . mc/mark-next-like-this)
          ("C-<" . mc/mark-previous-like-this)
          ("C-c C->" . mc/mark-all-like-this)))

(use-package smartparens
  :ensure ;
  :diminish smartparens-mode
  :config
  (add-hook 'prog-mode-hook 'smartparens-mode)
  )

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  )

;; undo-tree
;; Treat undo history as a tree.
(use-package undo-tree
  :requires (evil-leader)
  :straight (undo-tree :type git :host github :repo "tarsiiformes/undo-tree")
  :diminish undo-tree-mode
  :bind ("C-x u" . undo-tree-visualize)
  :init
  (evil-leader/set-key "u" 'undo-tree-visualize)
  :config
  (global-undo-tree-mode)
  (setq undo-tree-visualizer-timestamps t)
  (setq undo-tree-visualizer-diff t))

;; aggressive-indent
;; amazing plugin - gives us perfect indentation automatically for code
(use-package aggressive-indent
  :ensure t
  :diminish aggressive-indent-mode
  :hook ((lisp-mode lisp-interaction-mode emacs-lisp-mode clojure-mode) . aggressive-indent-mode)
  :config
  (defvar aggressive-indent/excluded '())
  (setq aggressive-indent/excluded '(php-mode go-mode markdown-mode rst-mode html-mode ruby-mode python-mode yaml-mode haskell-mode))
  (dolist (item aggressive-indent/excluded)
    (add-to-list 'aggressive-indent-excluded-modes item))
  (add-to-list
    'aggressive-indent-dont-indent-if
    '(and (or (derived-mode-p 'c-mode)
            (eq major-mode 'rust-mode))
       (null (string-match "\\([;{}]\\|\\b\\(if\\|for\\|while\\)\\b\\)"
               (thing-at-point 'line)))))
  )

(provide 'module-editing)
;;; module-editing.el ends here

;;; module-projects.el --- Project management         -*- lexical-binding: t; -*-
;;; code:

(require 'core-vars)

(use-package projectile
  :bind-keymap
  ("C-c q" . projectile-command-map)
  :init
  (setq projectile-keymap-prefix (kbd "C-c q"))
  :config
  (setq projectile-completion-system 'ivy)
  (setq projectile-require-project-root nil)
  (projectile-mode)
  :delight
  projectile-mode 1)


(use-package counsel-projectile
  :requires (evil-leader)
  :bind-keymap
  ("C-c q" . counsel-projectile-command-map)
  :config
  (counsel-projectile-mode)
  :init
  (evil-leader/set-key "fe" 'find-file)
  (evil-leader/set-key "ff" 'counsel-projectile-ag)
  (evil-leader/set-key "fp" 'counsel-projectile-find-file)
  )

(use-package helm-ghq
  :requires (evil-leader)
  :bind
  ("C-x C-q" . 'helm-ghq)
  :init
  (evil-leader/set-key "fsp" 'helm-ghq)
  )

(provide 'module-projects)
;;; module-projects.el ends here

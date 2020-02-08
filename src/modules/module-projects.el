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
  :bind-keymap
  ("C-c q" . counsel-projectile-command-map)
  :config
  (counsel-projectile-mode)
  :init
  (evil-leader/set-key "fe" 'find-file)
  (evil-leader/set-key "ff" 'counsel-projectile-ag)
  (evil-leader/set-key "fp" 'counsel-projectile-find-file)
  (evil-leader/set-key "fsp" 'counsel-projectile-switch-project)
  )

(provide 'module-projects)
;;; module-projects.el ends here

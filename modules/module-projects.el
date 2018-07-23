;;; module-projects.el --- Project management         -*- lexical-binding: t; -*-
;;; code:

(require 'core-vars)

(use-package counsel-projectile
  ;; :commands (all-the-icons-icon-for-dir all-the-icons-icon-for-file)
  :init
  (counsel-projectile-mode)
  (evil-leader/set-key "fsp" 'counsel-projectile-switch-project)
  (evil-leader/set-key "ff" 'counsel-projectile-ag)
  (evil-leader/set-key "fp" 'counsel-projectile-find-file)
  ;; :config
  ;; (setq projectile-switch-project-action 'neotree-projectile-action)
  ;; (setq counsel-projectile-switch-project-action 'neotree-projectile-action)
  )

(provide 'module-projects)
;;; module-projects.el ends here

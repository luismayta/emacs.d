;;; module-projects.el --- Project management         -*- lexical-binding: t; -*-
;;; code:

(require 'core-vars)
(require 'core-functions)

(use-package projectile
  :requires (ivy)
  :bind-keymap
  ("C-c q" . projectile-command-map)
  :hook (after-init . projectile-mode)
  :init
  (setq projectile-keymap-prefix (kbd "C-c q")
    projectile-mode-line-prefix ""
    projectile-sort-order 'recentf)
  :config
  (setq projectile-completion-system 'ivy
    projectile-sort-order 'recentf
    projectile-indexing-method 'alien
    projectile-enable-caching nil)
  (when IS-WINDOWS
    (setq projectile-git-submodule-command nil
      ))
  ;; fd is super fast. Use it if available.
  (when (executable-find "fd")
    (setq projectile-hg-command fd-command)
    (setq projectile-git-command fd-command)
    (setq projectile-fossil-command fd-command)
    (setq projectile-bzr-command fd-command)
    (setq projectile-darcs-command fd-command)
    (setq projectile-svn-command fd-command)
    (setq projectile-generic-command fd-command))
  (projectile-mode))

(use-package counsel-projectile
  :after projectile
  :requires (evil-leader)
  :bind-keymap
  ("C-c q" . counsel-projectile-command-map)
  :hook (counsel-mode . counsel-projectile-mode)
  :config
  (counsel-projectile-mode)
  :init
  (evil-leader/set-key "ff" 'counsel-projectile-ag)
  (evil-leader/set-key "fp" 'core/smart-find-file)
  (evil-leader/set-key "fwp" 'counsel-projectile-switch-project)
  (setq counsel-projectile-grep-initial-input '(ivy-thing-at-point))
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

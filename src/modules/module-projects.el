;;; module-projects.el --- Project management         -*- lexical-binding: t; -*-
;;; code:

(require 'core-vars)

(use-package projectile
  :bind-keymap
  ("C-c q" . projectile-command-map)
  :hook (after-init . projectile-mode)
  :init
  (setq projectile-keymap-prefix (kbd "C-c q"))
  (setq projectile-mode-line-prefix ""
        projectile-sort-order 'recentf
        projectile-use-git-grep t)
  :config
  (setq projectile-completion-system 'ivy)
  (cond
   ((executable-find "fd")
    (setq projectile-generic-command
          (format "%s . --color=never --type f -0 -H -E .git"
                  "fd")
          projectile-git-command projectile-generic-command
          projectile-git-submodule-command nil
          ;; ensure Windows users get fd's benefits
          projectile-indexing-method 'alien))

   ((executable-find "rg")
    (setq projectile-generic-command
          (concat "rg -0 --files --color=never --hidden"
                  (cl-loop for dir in projectile-globally-ignored-directories
                           concat (format " --glob '!%s'" dir)))
          projectile-git-command projectile-generic-command
          projectile-git-submodule-command nil
          ;; ensure Windows users get rg's benefits
          projectile-indexing-method 'alien)))

  (when IS-WINDOWS
    (setq projectile-git-submodule-command nil
          projectile-enable-caching nil)))


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

;;; module-projects.el --- Project management         -*- lexical-binding: t; -*-
;;; code:

(require 'core-vars)

(use-package ivy
  :bind
  ("C-x s" . swiper)
  ("C-x C-r" . ivy-resume)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers nil)
  (define-key read-expression-map (kbd "C-r") 'counsel-expression-history))

(use-package counsel
  :config
  (setq counsel-find-file-ignore-regexp ".*\.egg-info\\|__pycache__\\|.cache")
  :bind
  ("M-x" . counsel-M-x)
  ("C-x C-m" . counsel-M-x)
  ("C-x C-f" . counsel-find-file)
  ("C-x c k" . counsel-yank-pop)
  ("M-;" . counsel-imenu))

(use-package counsel-projectile
  :bind
  ("C-x v" . counsel-projectile)
  ("C-x c p" . counsel-projectile-ag)
  :config
  (counsel-projectile-on))

(use-package projectile
  :commands (projectile-ack
              projectile-ag
              projectile-compile-project
              projectile-dired
              projectile-find-dir
              projectile-find-file
              projectile-find-tag
              projectile-test-project
              projectile-grep
              projectile-invalidate-cache
              projectile-kill-buffers
              projectile-multi-occur
              projectile-project-p
              projectile-project-root
              projectile-recentf
              projectile-regenerate-tags
              projectile-replace
              projectile-replace-regexp
              projectile-run-async-shell-command-in-root
              projectile-run-shell-command-in-root
              projectile-switch-project
              projectile-switch-to-buffer
              projectile-vc)
  :init
  (progn
    (setq projectile-enable-caching t)
    (setq projectile-known-projects-file
      (expand-file-name "projectile-bookmarks.eld" temp-dir))
    (setq projectile-cache-file
      (expand-file-name "projectile.cache" temp-dir)))
  :config
  (setq projectile-completion-system 'ivy)
  (setq projectile-indexing-method 'alien)
  (setq projectile-switch-project-action 'projectile-dired)
  (setq projectile-sort-order 'recently-active)
  (setq projectile-globally-ignored-files (append '(".ensime"
                                                     ".gitignore"
                                                     ".bintray"
                                                     ".travis.yml"
                                                     ".mode"
                                                     ".cask")
                                            projectile-globally-ignored-files))
  (setq projectile-globally-ignored-directories
    '(".idea"
       ".eunit"
       ".git"
       ".hg"
       ".fslckout"
       ".bzr"
       "_darcs"
       ".tox"
       ".svn"
       "build"))
  (add-to-list 'projectile-globally-ignored-files ".DS_Store")
  (add-to-list 'projectile-globally-ignored-files "*.pyc")
  (add-to-list 'projectile-globally-ignored-files "*.python-version")
  (add-to-list 'projectile-globally-ignored-files "*.egg-info")
  (add-to-list 'projectile-globally-ignored-files "*.class")
  (add-to-list 'projectile-globally-ignored-files "*.jar")
  (add-to-list 'projectile-globally-ignored-files "*.tar")
  (add-to-list 'projectile-globally-ignored-files "*.tar.gz")
  (add-to-list 'projectile-globally-ignored-files "*.zip")
  (add-to-list 'projectile-globally-ignored-files "*.el~")
  (add-to-list 'projectile-globally-ignored-files "*.swp")

  (add-to-list 'projectile-globally-ignored-directories "__pycache__")
  (add-to-list 'projectile-globally-ignored-directories ".env")
  (add-to-list 'projectile-globally-ignored-directories ".venv")
  (add-to-list 'projectile-globally-ignored-directories ".cask")
  (add-to-list 'projectile-globally-ignored-directories ".cache")
  (add-to-list 'projectile-globally-ignored-directories "elpa")
  (add-to-list 'projectile-globally-ignored-directories ".node_modules")
  (add-to-list 'projectile-globally-ignored-directories ".m2")
  (projectile-mode)
  :bind
  ("C-x c a" . projectile-ag))

;; perspective
(use-package perspective
  :defer t
  :init (add-hook 'after-init-hook 'persp-mode)
  :config
  (setq persp-initial-frame-name "notes")
  (defun persp-next ()
    (interactive)
    (when (< (+ 1 (persp-curr-position)) (length (persp-all-names)))
      (persp-switch (nth (1+ (persp-curr-position)) (persp-all-names))))))

(provide 'module-projects)
;;; module-projects.el ends here

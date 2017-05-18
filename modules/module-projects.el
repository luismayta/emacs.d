;;; module-projects.el --- Project management         -*- lexical-binding: t; -*-
;;; code:

(use-package ivy
  :bind
  ("C-x s" . swiper)
  ("C-x C-r" . ivy-resume)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers nil)
  (define-key read-expression-map (kbd "C-r") 'counsel-expression-history))

(use-package projectile
  :config
  (setq projectile-enable-caching t
    projectile-cache-file (expand-file-name "projectile.cache" temp-dir)
    projectile-known-projects-file (expand-file-name "projectile-bookmarks.eld" temp-dir))
  (setq projectile-completion-system 'ivy)
  (projectile-global-mode)
  :bind
  ("C-x c a" . projectile-ag))

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

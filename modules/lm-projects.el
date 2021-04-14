;;; lm-projects.el --- Configuration for working with projects.

;; projectile
(use-package projectile
  :diminish projectile-mode
  :commands (projectile-mode projectile-global-mode)
  :bind ("C-c p a" . projectile-ag)
  :init (add-hook 'after-init-hook 'projectile-global-mode)
  :config
  ;; Ensure projectile dir exists.
  (defvar my-projectile-dir (lm/cache-for "projectile"))
  (lm/mkdir-p my-projectile-dir)
  ;; Use projectile dir for cache and bookmarks.
  (let* ((prj-dir (file-name-as-directory my-projectile-dir))
         (prj-cache-file (concat prj-dir "projectile.cache"))
         (prj-bookmarks-file (concat prj-dir "projectile-bkmrks.eld")))
    (setq projectile-cache-file          prj-cache-file
          projectile-known-projects-file prj-bookmarks-file
          projectile-indexing-method     'alien)))

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

(provide 'lm-projects)

;;; module-projects.el --- Project management         -*- lexical-binding: t; -*-
;;; code:

(require 'core-vars)

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

;; Projectile
(use-package projectile
  :ensure t
  :init
  (use-package counsel-projectile :ensure t)
  :commands
  (counsel-projectile
    projectile-find-file)
  :config
  (projectile-mode 1)
  (counsel-projectile-on)
  )

(provide 'module-projects)
;;; module-projects.el ends here
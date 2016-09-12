;;; lm-projects.el --- Configuration for working with projects.
;;; code:

;; projectile
(use-package helm-projectile
  :commands (helm-projectile-on))

(use-package projectile
  :diminish projectile-mode
  :commands (projectile-mode projectile-global-mode)
  :bind ("C-c p a" . projectile-ag)
  :init
  (add-hook 'after-init-hook 'projectile-global-mode)
  :config
  (setq projectile-completion-system 'helm)
  (setq projectile-file-exists-local-cache-expire (* 5 60)))

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

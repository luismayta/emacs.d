;--------------------------------;
;;; Projectile Settings        ;;;
;--------------------------------;

;; Install Packages
(bundle 'projectile nil)
(bundle 'helm-projectile nil)

(require 'projectile)

(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(setq projectile-file-exists-local-cache-expire (* 5 60))

(provide 'projectile-settings)

;--------------------------------;
;;; Projectile Settings        ;;;
;--------------------------------;
;;; code:

;; Install Packages
(package-require 'projectile)
(package-require 'helm-projectile)

(require 'projectile)

(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(setq projectile-file-exists-local-cache-expire (* 5 60))

(provide 'projectile-settings)

;; Install Packages
(bundle 'projectile nil)
(bundle 'helm-projectile nil)

(require 'projectile)

(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(setq projectile-file-exists-local-cache-expire (* 5 60))

;; mapping keys evil leader
(evil-leader/set-key
  "fp" 'helm-projectile-find-file)

;; Install Packages
(bundle 'projectile nil)
(require 'projectile)

(projectile-global-mode)
(setq projectile-file-exists-local-cache-expire (* 5 60))

;; mapping keys evil leader
(evil-leader/set-key
  "fp" 'projectile-find-file)

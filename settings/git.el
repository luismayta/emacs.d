;; Install Packages
(bundle 'magit nil)
(bundle 'gitconfig-mode nil)
(bundle 'gitignore-mode nil)

(require 'magit)

;; mapping keys evil leader
(evil-leader/set-key
  "gs" 'magit-status
  "gc" 'magit-commit
  "gd" 'magit-diff)

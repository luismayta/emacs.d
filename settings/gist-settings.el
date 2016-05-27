;; Install Packages
(bundle 'git nil)
(bundle 'gist nil)

(require 'git)
(require 'gist)

;; mapping keys evil leader
(evil-leader/set-key
  "gl" 'gist-list
  "gb" 'gist-buffer)

(provide 'gist-settings)

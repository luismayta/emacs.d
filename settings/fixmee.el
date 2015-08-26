;; Install Packages
(bundle 'fixmee nil)
(require 'fixmee)

(fixmee-mode)
(global-fixmee-mode 1)

(evil-leader/set-key
  "fm" 'fixmee-view-listing
  )

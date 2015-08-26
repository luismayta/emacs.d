;--------------------------------;
;;; Fixmee Settings            ;;;
;--------------------------------;

;; Install Packages
(bundle 'fixmee nil)
(require 'fixmee)

(fixmee-mode)
(global-fixmee-mode t)

(evil-leader/set-key
  "fm" 'fixmee-view-listing
  )

(provide 'fixmee-settings)
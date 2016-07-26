;--------------------------;
;;;    Ecb Settings      ;;;
;--------------------------;

;; Install Packages
(el-get-install 'ecb nil)

(require 'ecb)

(setq ecb-auto-activate t)
(setq ecb-layout-name "left13")
(setq ecb-new-ecb-frame nil)
(setq ecb-tip-of-the-day nil)
(setq ecb-windows-width 13)

(provide 'ecb-settings)

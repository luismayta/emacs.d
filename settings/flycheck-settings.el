;; Install Packages

;;; code:
(bundle 'flycheck nil)
(bundle 'flycheck-color-mode-line nil)
(bundle 'flycheck-pos-tip nil)
(require 'flycheck)

(global-flycheck-mode)
(flycheck-pos-tip-mode)
(eval-after-load "flycheck"
  '(progn
     (setq flycheck-highlighting-mode 'symbols)
     ;; (setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages)
     (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)
     (set-face-background 'flycheck-error "#660000")
     (set-face-foreground 'flycheck-error nil)
     (set-face-background 'flycheck-warning "#775500")
     (set-face-foreground 'flycheck-warning nil)
     (require 'flycheck-color-mode-line)
     (set-face-background 'flycheck-color-mode-line-error-face "#660000")
     (set-face-background 'flycheck-color-mode-line-warning-face "#553300")
     (set-face-background 'flycheck-color-mode-line-info-face nil)
     (set-face-foreground 'flycheck-color-mode-line-error-face nil)
     (set-face-foreground 'flycheck-color-mode-line-warning-face nil)
     (set-face-foreground 'flycheck-color-mode-line-info-face nil)))


(provide 'flycheck-settings)

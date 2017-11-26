;; Module-tools --- tools
;;; code:

(use-package alert
  :ensure t)

;; pomodoro timer
(use-package pomidor
  :ensure t
  :config
  (setq alert-default-style 'libnotify)
  (setq pomidor-update-interval 30) ; seconds
  :init
  (evil-leader/set-key "po" 'pomidor)
  )

;; password-store
;;(use-package pass
;;  :ensure t)

;;(use-package auth-password-store
;;  :ensure t)

(use-package kurecolor
  :ensure t)

(provide 'module-tools)
;;; module-editing.el ends here

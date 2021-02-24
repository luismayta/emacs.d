;; Module-tools --- tools
;;; code:

(use-package alert
  :ensure t)

;; pomodoro timer
(use-package pomidor
  :ensure t
  :config
  (setq pomidor-update-interval 30) ; seconds
  :init
  (evil-leader/set-key "po" 'pomidor)
  )

(use-package atomic-chrome
  :ensure t
  :init
  (setq atomic-chrome-url-major-mode-alist
    '(("github\\.com" . gfm-mode)
       ("redmine" . textile-mode)
       ("gmail" . markdown-mode)
       )
    )
  (message "this hacker")
  :config
  (atomic-chrome-start-server)
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

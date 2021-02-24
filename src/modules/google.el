;;; module/google.el --- Display and appearance related settings.

;;; code:
(use-package google-translate
  :requires (evil-leader)
  :config
  (setq google-translate-translation-directions-alist
    '(("en" . "es") ("es" . "en") ("de" . "fr") ("fr" . "de")))
  :init
  (evil-leader/set-key "gt" 'google-translate-smooth-translate)
  (evil-leader/set-key "gp" 'google-translate-at-point)
  )

(use-package google-this
  :requires (evil-leader)
  :ensure t
  :config
  (progn
    (message "Google This - Loaded"))
  :init
  (evil-leader/set-key "gg" 'google-this))

(provide 'module/google)
;;; module/google.el ends here

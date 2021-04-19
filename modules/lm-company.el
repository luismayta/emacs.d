;;; lm-company.el --- Company config               -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Luis Mayta

;; Keywords: autocomplete

;;; Commentary:

;;

;;; Code:
(use-package company
  :diminish " ©"
  :commands (company-mode global-company-mode)
  :init
  (add-hook 'prog-mode-hook #'company-mode)
  (add-hook 'comint-mode-hook #'company-mode)
  :config
  ;; Quick-help (popup documentation for suggestions).
  (use-package company-quickhelp
    :if window-system
    :init (company-quickhelp-mode 1))
  ;; Company settings.
  (setq-default company-backends (remove 'company-eclim company-backends))
  (setq company-tooltip-limit 20)
  (setq company-idle-delay 0.25)
  (setq company-echo-delay 0)
  (setq company-minimum-prefix-length 2)
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (setq company-backends (remove 'company-clang company-backends))
  (setq company-backends
    (mapcar #'lm/backend-with-yas company-backends)))

(provide 'lm-company)
;;; lm-company.el ends here

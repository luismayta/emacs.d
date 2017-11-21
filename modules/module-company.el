;;; module-company.el --- Company config               -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Luis Mayta

;; Keywords: autocomplete

;;; Commentary:

;;; Code:

;; company - easy auto-completion of code for all modes and documentation integration
(use-package company
  :ensure t
  :defer t
  :init
  (use-package company-flx
    :ensure t
    :config
    (with-eval-after-load 'company
      (company-flx-mode t)))
  (use-package company-statistics
    :ensure t
    :diminish company-statistics-mode
    :config
    (add-hook 'after-init-hook #'company-statistics-mode))
  (use-package company-quickhelp
    :ensure t
    :config
    (company-quickhelp-mode 1)
    (setq company-quickhelp-delay 1))
                                        ;(use-package company-dabbrev
                                        ; :init
                                        ;(setq company-dabbrev-ignore-case nil
  ;; don't downcase dabbrev suggestions
                                        ; company-dabbrev-code-other-buffers t
                                        ;company-tooltip-align-annotations t
                                        ;company-dabbrev-downcase nil))
                                        ;(use-package company-dabbrev-code
                                        ; :init
                                        ;(setq company-dabbrev-code-modes t
                                        ; company-dabbrev-code-ignore-case nil))
  :diminish company-mode
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  ;; Make it work more like	Vim's YCM, TAB cycling
  (company-tng-configure-default)
  ;; More convenient bindings
  (setq company-minimum-prefix-length 3
    company-tooltip-limit 10
    company-idle-delay 0.5
    company-show-numbers t
    company-require-match 'never
    company-selection-wrap-around t
    company-tooltip-align-annotations t))

(provide 'module-company)
;;; module-company.el ends here

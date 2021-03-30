;;; module-completion.el --- Company config               -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Luis Mayta

;; Keywords: autocomplete

;;; Commentary:

;; Search, navigation, and completion:
;; this module includes
;;   - ivy
;;   - counsel
;;   - which-key
;;   - avy
;;   - YaSnippet
;;   - company

;;; Code:
(use-package company
  :quelpa (company :fetcher github
		        :repo "company-mode/company-mode")
  :diminish company-mode
  :config
  (setq company-tooltip-align-annotations t)
  (setq company-minimum-prefix-length 1
    company-idle-delay 0.0) ;; default is 0.2
  :init
  (global-company-mode t)
  )

(provide 'module-completion)
;;; module-completion.el ends here

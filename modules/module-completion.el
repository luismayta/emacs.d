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
	:custom
		(
			(company-idle-delay 1)
			(company-echo-delay 0)
      (company-show-numbers t)
      (company-tooltip-limit 20)
			(company-selection-wrap-around t)
			(company-minimum-prefix-length 3)
			(company-tooltip-align-annotations t)
			(company-dabbrev-downcase nil)
			;(company-frontends '(company-box-frontend))
		)
	:bind
	(
		:map company-active-map
			("RET" . nil)
			("TAB" . company-complete-selection)
			("<tab>" . company-complete-selection)
			("C-s" . company-complete-selection)  ; Mostly to use during yasnippet expansion
			("C-n" . company-select-next)
			("C-p" . company-select-previous)
	)
	:config
		(global-company-mode)
)

(use-package company-box
	:after (company)
	:custom
	(
		(company-box-show-single-candidate t)
    (company-box-backends-colors nil) ;; Same colors for all backends
	)
	:custom-face
		(company-box-selection ((t (:inherit company-tooltip-selection :extend t))))
	:hook
		(company-mode . company-box-mode)
)

(provide 'module-completion)
;;; module-completion.el ends here

;--------------------------------;
;;; feature Settings           ;;;
;--------------------------------;
;;; code:
(package-require 'feature-mode)

;; Add Hook
(require 'feature-mode)

(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

(provide 'feature-settings)

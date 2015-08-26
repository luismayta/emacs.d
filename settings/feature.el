;; Install Packages
(bundle 'feature-mode nil)

;; Add Hook
(require 'feature-mode)

(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

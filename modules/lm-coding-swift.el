;;; lm-coding-swift.el --- Swift configuration.

;; swift
(use-package swift-mode
  :commands swift-mode
  :mode ("\\.swift\\'" . swift-mode)
  :config
  (use-package company-sourcekit
    :config
    (add-to-list 'company-backends 'company-sourcekit)))

(provide 'lm-coding-swift)

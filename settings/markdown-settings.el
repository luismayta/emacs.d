;; Install Packages
(bundle 'markdown-mode nil)
;; Config
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(provide 'markdown-settings)

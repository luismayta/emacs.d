;; Install Packages
(bundle 'company-mode nil)
(require 'company-mode)

(company-mode t)
(add-hook 'after-init-hook 'global-company-mode)

(provide 'company-settings)

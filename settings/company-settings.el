;; Install Packages
(bundle 'company nil)
(require 'company)

(company-mode t)
(add-hook 'after-init-hook 'global-company-mode)

(provide 'company-settings)

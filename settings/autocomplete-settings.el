;; Install Packages
(bundle 'auto-complete nil)
(require 'auto-complete)

(ac-config-default)
(global-auto-complete-mode t)
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

(provide 'autocomplete-settings)

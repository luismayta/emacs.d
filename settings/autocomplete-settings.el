;; Install Packages
(bundle 'auto-complete nil)
(require 'auto-complete)

;; turn on auto-completion of function names etc
(setq ac-auto-start nil)
(setq ac-trigger-key "TAB")

(global-auto-complete-mode t)
(auto-complete-mode t)

(provide 'autocomplete-settings)

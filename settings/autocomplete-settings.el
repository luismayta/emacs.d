;; Install Packages
(bundle 'auto-complete nil)
(require 'auto-complete)

;; turn on auto-completion of function names etc
(global-auto-complete-mode t)
(auto-complete-mode t)

(provide 'autocomplete-settings)
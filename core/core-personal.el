;;; personal---load files
;;;code:
(require 'lm-defuns)

(setq my-settings
  '(
     "~/.emacs.d/custom.el"
     ))

(dolist (setting my-settings)
  (when (file-exists-p setting)
    (load setting)))

(provide 'core-personal)

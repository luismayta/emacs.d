;;; module/term.el --- Terminal config.
;;; code:

(require 'core/vars)

(defadvice ansi-term (before force-bash)
  (interactive (list core-term-shell)))
(ad-activate 'ansi-term)

(provide 'module/term)
;;; module/term.el ends here

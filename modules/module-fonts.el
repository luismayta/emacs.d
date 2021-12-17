;;; module-fonts.el --- setup fonts.

(require 'core-vars)

(when (window-system)
  (set-language-environment "UTF-8")
  (set-default-coding-systems 'utf-8)
  (set-frame-font core-fixed-font-name))

(provide 'module-fonts)
;;; module-fonts.el ends here

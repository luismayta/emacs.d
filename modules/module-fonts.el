;;; module-fonts.el --- setup fonts.

(require 'core-vars)

(when (window-system)
  (set-language-environment "UTF-8")
  (set-default-coding-systems 'utf-8)
  (set-frame-font core-fixed-font-name))

;; Fira code
;; This works when using emacs --daemon + emacsclient
(add-hook 'after-make-frame-functions (lambda (frame) (set-fontset-font t '(#Xe100 . #Xe16f) core-fixed-font-name)))
;; This works when using emacs without server/client
(set-fontset-font t '(#Xe100 . #Xe16f) core-fixed-font-name)

(provide 'module-fonts)
;;; module-fonts.el ends here

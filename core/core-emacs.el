;;; core-emacs.el --- def vars.

;;; code:

;; Packages need to be initialised in init.el in Emacs 25.x.
(unless (fboundp 'package-initialize)
  (require 'package))
(package-initialize)

(require 'core-aliases)
(require 'core-vars)
(require 'core-defaults)
(require 'core-defuns)
(require 'core-modules)

(defun emacs/init ()
  "Perform startup initialization."
  ;; Load configured modules.
  (core/load-modules)
  (message "Finish Install packages!"))

(provide 'core-emacs.el)
;;; core-aliases ends here

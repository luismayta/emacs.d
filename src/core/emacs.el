;;; core/emacs.el --- def vars.

;;; code:

;; Packages need to be initialised in init.el in Emacs 25.x.
(unless (fboundp 'package-initialize)
  (require 'package))
(package-initialize)

(require 'core/load-paths)
(require 'core/aliases)
(require 'core/vars)
(require 'core/defaults)
(require 'core/functions)
(require 'core/modules)

(use-package dash
  :ensure t)

(defun emacs/init ()
  "Perform startup initialization."
  ;; Load configured modules.
  (core/initialize)
  (message "Finish Install packages!"))

(provide 'core/emacs)
;;; core/emacs ends here

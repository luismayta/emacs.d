;;; core-init.el --- def vars.

;;; code:

;; Packages need to be initialised in init.el in Emacs 25.x.
(unless (fboundp 'package-initialize)
  (require 'package))

(require 'core-vars)
(require 'core-load)
(require 'core-functions)
; (require 'core-aliases)
(require 'core-defaults)
(require 'core-modules)

;;; code:
(defun core-initialize ()
  "Initialize `package.el'."
  (setq package-enable-at-startup nil)
  (unless package-archive-contents
    (package-refresh-contents)
    ;; Ensure `use-package' is installed.
    (when (not (package-installed-p 'use-package))
      (package-install 'use-package)
      (setq use-package-always-ensure t))
    )
  (core-load-modules))

(provide 'core-init)
;;; core-init ends here

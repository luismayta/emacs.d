;;; init.el --- Start of the Emacs initialisation process.
;;; code:

(load-file (concat (file-name-directory load-file-name)
               "core/core-vars.el"))
(load-file (concat (file-name-directory load-file-name)
               "core/core-load.el"))

(require 'core-vars)
(require 'core-load)
(require 'core-defaults)
(require 'config-default)

(setq package-archives '(
                         ("gnu"   . "https://elpa.gnu.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         )
      )

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents)
  ;; Ensure `use-package' is installed.
  (when (not (package-installed-p 'use-package))
    (package-install 'use-package)
    (setq use-package-always-ensure t))
  )

(require 'use-package)
(setq use-package-always-ensure t)

(use-package quelpa-use-package
  :custom
  (quelpa-checkout-melpa-p nil))

(defconst project-version     "1.6.3" "Version.")
(defconst emacs-min-version   "24.4" "Minimal version of Emacs.")

(if (not (version<= emacs-min-version emacs-version))
  (error (concat "Your version of Emacs (%s) is too old. "
           "requires Emacs version %s or above.")
    emacs-version emacs-min-version)
  (require 'core-init)
  (core-initialize))

(provide 'init)
;;; init.el ends here

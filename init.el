;;; init.el --- Start of the Emacs initialisation process.

;;; code:
(package-initialize)
(add-to-list 'package-archives
             '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives 
  '("melpa" . "https://melpa.org/packages/") t )
;(add-to-list 'package-archives
;  '("melpa-mirror" . "https://www.mirrorservice.org/sites/melpa.org/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives 
  '("org" . "http://orgmode.org/elpa/") t)


;;("melpa-stable". "http://stable.melpa.org/packages/")

(unless package-archive-contents
  (package-refresh-contents)
  ;; Ensure `use-package' is installed.
  (when (not (package-installed-p 'use-package))
    (package-install 'use-package)
    (setq use-package-always-ensure t))
  )


;; Increase the GC threshold as soon as possible.
(setq gc-cons-threshold 50000000)

(defconst project-version         "1.4.0" "Version.")
(defconst emacs-min-version   "24.4" "Minimal version of Emacs.")

(if (not (version<= emacs-min-version emacs-version))
  (error (concat "Your version of Emacs (%s) is too old. "
           "requires Emacs version %s or above.")
    emacs-version emacs-min-version)
  (load-file (concat (file-name-directory load-file-name)
               "core/core-vars.el"))
  (load-file (concat (file-name-directory load-file-name)
               "core/core-load-paths.el"))
  (require 'core-emacs)
  (emacs/init))

(provide 'init)
;;; init.el ends here

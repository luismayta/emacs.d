;;; init.el --- Start of the Emacs initialisation process.
(load-to-list 'load-path (concat (file-name-directory load-file-name)
                           "/src/core"))
(load-to-list 'load-path (concat (file-name-directory load-file-name)
                           "/src/config"))

(require 'core/vars)
(require 'config/default)
(require 'config/backup)

;;; code:
(package-initialize)
(add-to-list 'package-archives
  '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives
  '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
  '("melpa" . "https://melpa.org/packages/") t )


(package-initialize)

(unless package-archive-contents
  (package-refresh-contents)
  ;; Ensure `use-package' is installed.
  (when (not (package-installed-p 'use-package))
    (package-install 'use-package)
    (setq use-package-always-ensure t))
  )

(defconst project-version     "1.6.3" "Version.")
(defconst emacs-min-version   "24.4" "Minimal version of Emacs.")

(if (not (version<= emacs-min-version emacs-version))
  (error (concat "Your version of Emacs (%s) is too old. "
           "requires Emacs version %s or above.")
    emacs-version emacs-min-version)
  (require 'core/emacs)
  (emacs/init))

(provide 'init)
;;; init.el ends here

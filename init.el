;;; init.el --- Start of the Emacs initialisation process.
;;; code:

;; Increase the garbage collection threshold to 500 MB to ease startup
(setq gc-cons-threshold (* 500 1024 1024)
      gc-cons-percentage 0.6
      ;; gc-cons-threshold (* 1024 1024 1024) ;1G
      jit-lock-stealth-time 0.1
      jit-lock-chunk-size 100
      jit-lock-defer-time 0.1)

;; Garbage collector - decrease threshold to 5 MB after startup
(add-hook 'after-init-hook (lambda () (setq gc-cons-threshold (* 5 1024 1024))))

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

; (if (version< emacs-version "27")
(package-initialize)

(require 'package)
(setq package-archives
      '(
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("org" . "https://orgmode.org/elpa/")))

(load-file (concat (file-name-directory load-file-name)
               "core/core-vars.el"))
(load-file (concat (file-name-directory load-file-name)
               "core/core-load.el"))
(load-file (concat (file-name-directory load-file-name)
               "core/core-macros.el"))

(require 'core-vars)
(require 'core-load)
(require 'core-defaults)
(require 'core-macros)
(require 'config-default)

(unless package-archive-contents
  (package-refresh-contents)
  ;; Ensure `use-package' is installed.
  (when (not (package-installed-p 'use-package))
    (package-install 'use-package)
    (setq use-package-always-ensure t))
  )

(require 'use-package)
(setq use-package-always-ensure t)

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

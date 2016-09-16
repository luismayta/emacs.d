;;; lm-modules.el --- Configures available modules and the package manager.

;;; code:

;; Repositories
;; The ELPA repositories from where the packages are fetched.
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                          ("melpa" . "http://melpa.org/packages/")
                          ("org" . "http://orgmode.org/elpa/")
                          ("elpy" . "https://jorgenschaefer.github.io/packages/")
                          ("marmalade" . "http://marmalade-repo.org/packages/")))

;; Refresh the archive if we have no local cache.
(unless package-archive-contents
  (package-refresh-contents))

;; Ensure `use-package' is installed.
(when (not (package-installed-p 'use-package))
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(setq lm/modules
  '(lm-path
     lm-editing
     lm-ui
     lm-appearance
     lm-snippets
     lm-searching
     lm-navigation
     lm-company
     lm-writing
     lm-projects
     projectile-settings
     lm-source-control
     lm-coding-general
     lm-coding-elixir
     lm-coding-java
     lm-coding-js
     lm-coding-python
     lm-coding-ruby
     lm-coding-swift
     lm-coding-haskell
     lm-coding-rust
     lm-company
     lm-coding-evil
     )
  )

(defun lm/load-modules ()
  (interactive)
  (dolist (module lm/modules) (require module)))

(provide 'lm-modules)

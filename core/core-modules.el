;;; core-modules.el --- Configures available modules and the package manager.

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

(setq core/modules
  '(module-path
     module-editing
     module-ui
     module-appearance
     module-snippets
     module-searching
     module-navigation
     module-writing
     module-projects
     module-source-control
     module-coding-general
     module-coding-ansible
     module-coding-docker
     module-coding-elixir
     module-coding-java
     module-coding-js
     module-coding-php
     module-coding-python
     module-coding-ruby
     module-coding-swift
     module-coding-haskell
     module-coding-rust
     module-coding-go
     module-company
     module-coding-evil
     )
  )

(defun module/load-modules ()
  (interactive)
  (dolist (module core/modules) (require module)))

(provide 'core-modules)

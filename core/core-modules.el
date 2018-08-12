;;; core-modules.el --- Configures available modules and the package manager.

(setq  package-archives '( ("gnu" . "http://elpa.gnu.org/packages/")
                           ("melpa" . "http://melpa.org/packages/")
                           ("melpa-stable". "http://stable.melpa.org/packages/")
                           ("marmalade" . "http://marmalade-repo.org/packages/")
                           ("org" . "http://orgmode.org/elpa/")
                           )
  )

;;; code:
(defun core/initialize ()
  "Initialize `package.el'."
  (package-initialize)
  (setq package-enable-at-startup nil)
  (unless package-archive-contents
    (package-refresh-contents)
    ;; Ensure `use-package' is installed.
    (when (not (package-installed-p 'use-package))
      (package-install 'use-package)
      (setq use-package-always-ensure t))
    )
  (core/load-modules))

(setq modules
  '(
     module-utils
     module-coding-evil
     module-tools
     module-path
     module-editing
     module-ui
     module-appearance
     module-searching
     module-navigation
     module-writing
     module-completion
     module-projects
     module-tags
     module-coding-ansible
     module-source-control
     module-coding-docker
     module-coding-haskell
     module-coding-general
     module-coding-elixir
     module-coding-java
     module-coding-js
     module-coding-typescript
     module-coding-lua
     module-coding-php
     module-coding-python
     module-coding-ruby
     module-coding-swift
     module-coding-ethereum
     module-coding-go
     module-coding-rust
     module-coding-terraform
     module-term
     module-org
     module-google
     )
  )

(defun core/load-modules ()
  (interactive)
  (dolist (module modules) (require module))
  )

(provide 'core-modules)
;;; core-modules.el ends here

;;; core-modules.el --- Configures available modules and the package manager.

(setq modules
  '(
     module-utils
     module-evil
     module-tools
     module-path
     module-editing
     module-ui
     module-fonts
     module-appearance
     module-searching
     module-navigation
     module-writing
     module-completion
     module-projects
     ;; module-tags
     module-http
     module-sh
     module-ansible
     module-source-control
     module-docker
     module-haskell
     module-general
     module-lsp
     module-graphql
     module-elixir
     module-java
     module-js
     module-web
     module-typescript
     module-lua
     module-clojure
     module-php
     module-python
     module-ruby
     module-swift
     module-ethereum
     module-iot
     module-go
     module-rust
     module-hashicorp
     module-dart
     module-term
                                        ; module-org
     module-google
     )
  )

(defun core-load-modules ()
  (interactive)
  (dolist (module modules) (require module))
  )

(provide 'core-modules)
;;; core-modules.el ends here

;; Use $PATH from user's shell in Emacs.
;; code:

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-copy-env "PATH")
  (exec-path-from-shell-copy-env "GOPATH")
  (exec-path-from-shell-copy-env "GOROOT")
  (exec-path-from-shell-copy-env "GO_ENV")
  (exec-path-from-shell-copy-env "DOCKER_HOST")
  (exec-path-from-shell-copy-env "DOCKER_TLS_VERIFY")
  (exec-path-from-shell-copy-env "DOCKER_CERT_PATH")
  (exec-path-from-shell-copy-env "DOCKER_MACHINE_NAME")
  (exec-path-from-shell-initialize))

(provide 'module-path)
;;; module-path.el ends here

;; Use $PATH from user's shell in Emacs.
;; code:


(use-package exec-path-from-shell
  :config
  (setq exec-path-from-shell-copy-env "PATH")
  (setq exec-path-from-shell-copy-env "GOPATH")
  (setq exec-path-from-shell-copy-env "GOROOT")
  (setq exec-path-from-shell-copy-env "GO_ENV")
  (setq exec-path-from-shell-copy-env "DOCKER_HOST")
  (setq exec-path-from-shell-copy-env "DOCKER_TLS_VERIFY")
  (setq exec-path-from-shell-copy-env "DOCKER_CERT_PATH")
  (setq exec-path-from-shell-copy-env "DOCKER_MACHINE_NAME")
  (setq exec-path-from-shell-copy-env "PLANTUML_JAR_PATH")
  (setq exec-path-from-shell-check-startup-files nil)
  (exec-path-from-shell-initialize))

(provide 'module-path)
;;; module-path.el ends here

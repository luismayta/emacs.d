;; Use $PATH from user's shell in Emacs.
;; code:

(use-package exec-path-from-shell
  :ensure t
  :if (memq window-system '(mac ns x))
  :config
  (setq exec-path-from-shell-variables '(
                                          "PATH"
                                          "GOPATH"
                                          "GOROOT"
                                          "GO_ENV"
                                          "PYTHONPATH"
                                          "PYENV_DIR"
                                          "PIPENV_PYTHON"
                                          "DOCKER_HOST"
                                          "DOCKER_TLS_VERIFY"
                                          "DOCKER_CERT_PATH"
                                          "DOCKER_MACHINE_NAME"
                                          "WAKATIME_API_KEY"
                                          "WAKATIME_CLI_PATH"
                                          "WAKATIME_PYTHON_BIN"
                                          "LC_ALL"
                                          ))
  (exec-path-from-shell-initialize))


(provide 'module/path)
;;; module/path.el ends here

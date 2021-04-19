;;; module-core.el --- Core settings.
;;; code:

(use-package use-package-ensure-system-package
  :ensure t)

(use-package auto-package-update
  :ensure t
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-now))

(use-package exec-path-from-shell
  :ensure t
  :if (memq window-system '(mac ns x))
  :config
  (setq exec-path-from-shell-variables '(
                                          "PATH"
                                          "GOPATH"
                                          "GOROOT"
                                          "GO_ENV"
                                          "GO111MODULES"
                                          "PYTHONPATH"
                                          "PYENV_DIR"
                                          "PIPENV_PYTHON"
                                          "DOCKER_HOST"
                                          "DOCKER_TLS_VERIFY"
                                          "DOCKER_CERT_PATH"
                                          "DOCKER_MACHINE_NAME"
                                          "LC_ALL"
                                          ))
  (exec-path-from-shell-initialize)
  )

(provide 'module-core)
;;; module-core.el ends here

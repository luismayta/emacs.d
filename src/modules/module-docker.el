;;; module-docker.el --- Docker config               -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Luis Mayta

;; Keywords: processes, tools, unix, abbrev

;;; Commentary:

;;

;;; Code:
(use-package dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

;; editing and completion for docker compose (YAML)
(use-package docker-compose-mode)

(use-package docker
  :ensure t
  :defer t)

(provide 'module-docker)
;;; module-docker.el ends here

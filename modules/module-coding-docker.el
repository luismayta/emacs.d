;;; module-coding-docker.el --- Docker config               -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Luis Mayta

;; Keywords: processes, tools, unix, abbrev

;;; Commentary:

;;

;;; Code:
(use-package dockerfile-mode
  :ensure t
  :defer t)

(use-package docker
  :ensure t
  :defer t)

(provide 'module-coding-docker)
;;; module-coding-docker.el ends here

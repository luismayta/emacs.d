;;; lm-coding-docker.el --- Docker configuration.

;;; code:
(use-package dockerfile-mode
  :mode (("\\Dockerfile\\'" . dockerfile-mode))
  :commands
  (dockerfile-mode t))

(provide 'lm-coding-docker)
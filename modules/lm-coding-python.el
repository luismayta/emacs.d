;;; lm-coding-python.el --- Python settings.
;;; code:
(use-package elpy
  :commands
  (elpy-enable)
  :init
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(use-package pyvenv)

;; (when (require 'flycheck nil t)
;;   (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;   (add-hook 'elpy-mode-hook 'flycheck-mode))

(provide 'lm-coding-python)

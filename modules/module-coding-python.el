;;; module-coding-python.el --- Python settings.
;;; code:
(use-package elpy
  :commands
  (elpy-enable)
  :init
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; company-jedi
(use-package company-jedi
  :ensure t)

;; (when (require 'flycheck nil t)
;;   (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;   (add-hook 'elpy-mode-hook 'flycheck-mode))

(provide 'module-coding-python)
;;; module-coding-python.el ends here

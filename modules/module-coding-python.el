;;; module-coding-python.el --- Python settings.
;;; code:
(use-package elpy
  :commands
  (elpy-enable elpy-use-ipython)
  :mode ("\\.py$" . elpy-mode)
  :init
  (add-hook 'elpy-mode-hook 'flycheck-mode)
  (add-hook 'python-mode-hook 'elpy-mode))

;; Install pyenv-mode-auto package
(use-package pyenv-mode-auto
  :init
  (pyenv-mode))

(use-package py-autopep8
  :init
  (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))

;; (when (require 'flycheck nil t)
;;   (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;   (add-hook 'elpy-mode-hook 'flycheck-mode))

(provide 'module-coding-python)
;;; module-coding-python.el ends here

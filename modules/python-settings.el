;;; python configuration
;;; code:
(package-require 'elpy)
(package-require 'pyvenv)

(require 'elpy)
(require 'pyvenv)
(require 'flycheck)

(elpy-enable)

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(provide 'python-settings)

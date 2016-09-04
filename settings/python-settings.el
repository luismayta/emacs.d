;;; python configuration
(bundle 'elpy nil)
(bundle 'pyvenv nil)

(require 'elpy)
(require 'pyvenv)
(require 'flycheck)

(elpy-enable)

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(provide 'python-settings)

;;; module-coding-python.el --- Python settings.
;;; code:

(require 'core-defuns)
(require 'core-vars)

(use-package anaconda-mode
  :ensure t
  :commands anaconda-mode
  :diminish anaconda-mode
  :init
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
  (evil-leader/set-key "gd" 'anaconda-mode-find-definitions)
  )

(use-package company-anaconda
  :ensure t
  :init (add-to-list 'company-backends 'company-anaconda))

(use-package pyenv-mode
  :ensure t
  :config
  (pyenv-mode))

(use-package pyenv-mode-auto
  :config
  (add-hook 'pyenv-mode-auto-hook
    (lambda () (shell-command "pip install autopep8 flake8 elpy jedi rope isort epc importmagic yapf pylint")))
  )

(use-package importmagic
  :straight t
  :disabled t
  :config (add-hook 'python-mode-hook 'importmagic-mode))

(use-package py-isort
  :ensure t
  :config
  (add-hook 'before-save-hook 'py-isort-before-save))

(use-package pyimport
  :ensure t
  )

(provide 'module-coding-python)
;;; module-coding-python.el ends here

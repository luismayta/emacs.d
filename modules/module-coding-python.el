;;; module-coding-python.el --- Python settings.
;;; code:

(require 'core-defuns)
(require 'core-vars)

(use-package python-mode
  :mode ("\\.py\\'" . python-mode)
  :config
  (use-package python-docstring
    :ensure t
    :init
    (add-hook 'python-mode-hook 'python-docstring-mode))
  )

;; Install pyenv-mode-auto package
(use-package pyenv-mode)

(use-package pyenv-mode-auto
  :config
  (add-hook 'pyenv-mode-auto-hook
    (lambda () (shell-command "pip install autopep8 flake8 elpy jedi rope isort epc importmagic yapf pylint")))
  )

(use-package elpy
  :ensure t
  :config
  (setq elpy-rpc-backend "jedi")
  (elpy-enable)
  (when (require 'flycheck nil t)
    (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
    (add-hook 'elpy-mode-hook 'flycheck-mode))
  (setq python-shell-interpreter "ipython"
    python-shell-interpreter-args "--simple-prompt --pprint")
  )

(use-package jedi
  :ensure t
  :init
  (add-hook 'python-mode 'jedi:setup)
  :config
  (setq jedi:complete-on-dot t)
  )

(use-package jedi-direx
  :ensure t
  )

(use-package company-jedi
  :init
  (progn
    (add-hook 'python-mode-hook
      (lambda ()
        (add-to-list (make-local-variable 'company-backends)
          '(company-jedi)))))
  )

(use-package py-autopep8
  :init
  (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
  )

(provide 'module-coding-python)
;;; module-coding-python.el ends here

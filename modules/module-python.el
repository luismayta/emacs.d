;;; module-python.el --- Python settings.
;;; code:

(require 'core-functions)
(require 'core-vars)

(use-package anaconda-mode
  :commands anaconda-mode
  :diminish anaconda-mode
  :init
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
  )

(use-package pyenv-mode
  :ensure t
  :config
  (pyenv-mode))

(use-package pyenv-mode-auto
  :quelpa (pyenv-mode-auto :fetcher github
		   :repo "ssbb/pyenv-mode-auto")
  :config
  (add-hook 'pyenv-mode-auto-hook
    (lambda () (shell-command "pip install mypy autopep8 flake8 elpy jedi rope isort epc importmagic yapf pylint")))
  )

(use-package pipenv
  :quelpa (pipenv :fetcher github
		   :repo "pwalsh/pipenv.el")
  :hook (python-mode . pipenv-mode)
  :init
  (setq
    pipenv-projectile-after-switch-function
    #'pipenv-projectile-after-switch-extended))

(use-package py-isort
  :ensure t
  :config
  (add-hook 'before-save-hook 'py-isort-before-save))

(use-package pyimport
  :ensure t
  )

(use-package flycheck-mypy
  :quelpa (flycheck-mypy :fetcher github
		   :repo "lbolla/emacs-flycheck-mypy")
             )

(use-package flycheck
  :init
  ;; disable noisy checkers
  (setq-default flycheck-disabled-checkers
    '(emacs-lisp emacs-lisp-checkdoc go-golint))

  ;; prefer python 3
  (let ((python "python3"))
    (when (executable-find python)
      (setq flycheck-python-flake8-executable python
        flycheck-python-pycompile-executable python
        flycheck-python-pylint-executable python)))

  :config
  (global-flycheck-mode 1))

(defun python/python-mode-hook ()
  "Python module hook."
  (anaconda-mode 1)
  (anaconda-eldoc-mode 1))

(add-hook 'python-mode-hook 'python/python-mode-hook)

(provide 'module-python)
;;; module-python.el ends here

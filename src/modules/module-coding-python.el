;;; module-coding-python.el --- Python settings.
;;; code:

(require 'core-defuns)
(require 'core-vars)

(use-package auto-virtualenv
  :ensure t
  :config
  (add-hook 'python-mode-hook 'auto-virtualenv-set-virtualenv)
  (add-hook 'projectile-after-switch-project-hook 'auto-virtualenv-set-virtualenv)
  (add-hook 'pyvenv-post-activate-hooks 'pyvenv-restart-python))

(use-package epc
  :ensure t)

(use-package python-environment
  :ensure t)

(use-package pyvenv
  :ensure t)

(use-package pyenv-mode
  :ensure t
  :config
  (pyenv-mode))

(use-package pyenv-mode-auto
  :config
  (add-hook 'pyenv-mode-auto-hook
    (lambda () (shell-command "pip install mypy autopep8 flake8 elpy jedi rope isort epc importmagic yapf pylint")))
  )

(use-package pipenv
  :hook (python-mode . pipenv-mode)
  :commands (pipenv-activate
              pipenv-deactivate
              pipenv-shell
              pipenv-open
              pipenv-install
              pipenv-uninstall)
  :init
  (setq
    pipenv-projectile-after-switch-function
    #'pipenv-projectile-after-switch-extended))

(use-package blacken
  :ensure t
  :diminish blacken-mode
  :hook (python-mode . blacken-mode)
  :config
  :bind (([?\C-c ?\C-x ?a] . blacken-buffer)))

(defun python/init-eldoc-mode ()
  "Setup eldoc."
  (eldoc-mode)
  (anaconda-eldoc-mode))


(defun python/init-indent ()
  "Setup indentation."
  (setq indent-tabs-mode nil))

(defun python/init-imenu ()
  "Setup imenu."
  (when (fboundp #'python-imenu-create-flat-index)
    (setq-local imenu-create-index-function
		  #'python-imenu-create-flat-index)))

(defun python/init-misc ()
  "Setup misc stuffs."
  (subword-mode +1)
  (pyvenv-mode t))

(defun python/init-flycheck ()
  "Setup flycheck."
  (flymake-mode -1)
  (flycheck-mode t)
  (flycheck-select-checker 'python-pycheckers))

(defun python/init-company ()
  "Setup company."
  (company-mode t))

(defun python/init-anaconda ()
  "Setup anaconda."
  (anaconda-mode t)
  (python/init-eldoc-mode))

(use-package flycheck
  :ensure t
  :config (add-hook 'python-mode-hook 'python/init-flycheck))

(use-package company
  :ensure t
  :config (add-hook 'python-mode-hook 'python/init-company))

(use-package anaconda-mode
  :ensure t
  :bind (:map anaconda-mode-map
	        ("C-c C-d" . anaconda-mode-show-doc)
	        ("M-?" . anaconda-mode-find-references))
  :init (evil-leader/set-key "gd" 'anaconda-mode-find-definitions)
  :config (add-hook 'python-mode-hook 'python/init-anaconda))

(use-package pip-requirements
  :ensure t)

(use-package flycheck-pycheckers
  :ensure t
  :config (progn (add-hook 'flycheck-mode-hook #'flycheck-pycheckers-setup)
            (setq flycheck-pycheckers-max-line-length 100)
            (setq flycheck-pycheckers-checkers '(pylint mypy3))))

(use-package python-docstring
  :ensure t)

(use-package importmagic
  :disabled t
  :config (add-hook 'python-mode-hook 'importmagic-mode))

(use-package py-isort
  :ensure t
  :config
  (add-hook 'before-save-hook 'py-isort-before-save))

(use-package pyimport
  :ensure t
  )

(add-hook 'python-mode-hook 'python/init-indent)
(add-hook 'python-mode-hook 'python/init-imenu)
(add-hook 'python-mode-hook 'python/init-misc)


(provide 'module-coding-python)
;;; module-coding-python.el ends here

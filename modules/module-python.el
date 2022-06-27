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

(use-package py-isort
  :ensure t
  :config
  (add-hook 'before-save-hook 'py-isort-before-save))

(use-package pyimport
  :ensure t
  )

(use-package flycheck-mypy
  :straight (flycheck-mypy :type git :host github :repo "lbolla/emacs-flycheck-mypy")
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

(use-package python
  :ensure-system-package
  (
    (pylsp . "pip install 'python-lsp-server[all]'")
    )
  :hook
  (python-mode . lsp)
  (python-mode . pyvenv-mode))

(use-package pyvenv
  ;; Using `(setq pyvenv-workon "foovenv")' as default in configuration
  ;; resulting in `foovenv' being used in non-visiting buffer such magit
  ;; before Emacs reading `pyvevn-workon' set in the `.dir-locals'.
  ;;
  ;; This creates a bug, where you can't change the venv anymore.
  ;; https://github.com/jorgenschaefer/pyvenv/pull/82/files
  ;; This behavior introduced by PR#28. It prevent re-activating new venv
  ;; if any venv already activated.

  ;; `:hook: python-mode' won't work. It says pyvenv undefined.
  ;; Maybe because `python-mode' has `(provide 'python) instead of `(provide 'python-mode)'
  ;; Need to use plain hook in the Python configuration above
  :config
  (setq pyvenv-mode-line-indicator
        '(pyvenv-virtual-env-name ("(🐍" pyvenv-virtual-env-name ") ")))

  ;; Automatically use pyvenv-workon via dir-locals
  ;; Use `M-x add-dir-local-variable' -> python-mode -> pyenv-workon -> venv name
  (pyvenv-tracking-mode 1)

  ;; Update venv name after the venv changes.
  ;; It doesn't handled by default
  (defun my/pyvenv-post-activation ()
    "Update venv name after activation. "
    (setq python-shell-interpreter (concat pyvenv-virtual-env "bin/python3")))
  (defun my/pyvenv-post-deactivation ()
    "Update venv name after deactivation."
    (setq python-shell-interpreter "python3"))

  (add-hook 'pyvenv-post-activate-hooks #'my/pyvenv-post-activation)
  (add-hook 'pyvenv-post-deactivate-hooks #'my/pyvenv-post-deactivation))

(provide 'module-python)
;;; module-python.el ends here

;;; module-coding-python.el --- Python settings.
;;; code:

(use-package python-mode
  :mode ("\\.py$" . python-mode))

(use-package python-docstring
  :ensure t
  :init
  (add-hook 'python-mode-hook 'python-docstring-mode))

(use-package elpy
  :ensure t
  :init
  (elpy-enable)
  :config
  (elpy-use-ipython)
  (setq python-shell-interpreter "ipython"
    python-shell-interpreter-args "--simple-prompt --pprint")

  (when (require 'flycheck nil t)
    (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
    (add-hook 'elpy-mode-hook 'flycheck-mode))

  (add-hook 'python-mode-hook
    (lambda ()
      (add-to-list (make-local-variable 'company-backends)
        '(elpy-company-backend))))
  (add-hook 'inferior-python-mode-hook
    (lambda ()
      (push
        'comint-watch-for-password-prompt comint-output-filter-functions)))
  )
;; (use-package elpy
;;   :ensure t
;;   :commands
;;   (elpy-enable elpy-use-ipython)
;;   :mode (("\\.py\\'" . elpy-mode)
;;           ("\\.py\\'"       . python-mode))
;;   :config
;;   (elpy-enable)
;;   (add-hook 'python-mode-hook 'elpy-enable)
;;   (add-hook 'elpy-mode-hook 'flycheck-mode))
;; (add-hook 'python-mode-hook 'elpy-mode))

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

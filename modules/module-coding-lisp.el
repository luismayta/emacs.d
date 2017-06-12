;;; module-coding-lisp.el --- Lisp settings.
;;; code:

(use-package emacs-lisp-mode
  :init
  (progn
    (use-package eldoc
      :init (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode))
    (use-package macrostep
      :bind ("C-c e" . macrostep-expand))
    (use-package ert
      :config (add-to-list 'emacs-lisp-mode-hook 'ert--activate-font-lock-keywords)))
  :config
  (progn
    (setq tab-always-indent 'complete)
    (add-to-list 'completion-styles 'initials t))
  :bind (("M-." . find-function-at-point)
          ("M-&" . complete-symbol))
  :mode (("\\.el$" . emacs-lisp-mode))
  :interpreter (("emacs" . emacs-lisp-mode)))

(provide 'module-coding-lisp)
;;; module-coding-lisp.el ends here

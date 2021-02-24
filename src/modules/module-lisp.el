;;; module-lisp.el --- Lisp settings.
;;; code:

(use-package emacs-lisp-mode
  :init
    (use-package eldoc
      :init (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode))
    (use-package macrostep
      :bind ("C-c e" . macrostep-expand))
    (use-package ert
      :config (add-to-list 'emacs-lisp-mode-hook 'ert--activate-font-lock-keywords))
  :bind (("M-." . find-function-at-point)
          ("M-&" . complete-symbol))
  :mode (("\\.el$" . emacs-lisp-mode))
  :interpreter (("emacs" . emacs-lisp-mode)))

(provide 'module-lisp)
;;; module-lisp.el ends here

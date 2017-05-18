;; Use $PATH from user's shell in Emacs.
;; code:
(use-package exec-path-from-shell
  :if (memq window-system (quote (mac ns)))
  :defer 2
  :config
  ;; Add GOPATH to shell
  (exec-path-from-shell-copy-env "GOPATH")
  (exec-path-from-shell-copy-env "PYTHONPATH")
  (exec-path-from-shell-initialize))

(provide 'module-path)
;;; module-path.el ends here

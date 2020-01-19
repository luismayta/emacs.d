;; module-coding-typescript.el --- TypeScript.

(use-package typescript-mode
  :ensure t
  )

(use-package tide
  :ensure t)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving

(add-hook 'typescript-mode-hook #'setup-tide-mode)
(setq tide-tsserver-process-environment '("TSS_LOG=-level verbose -file /tmp/tss.log"))

(provide 'module-coding-typescript)
;;; module-coding-typescript.el ends here

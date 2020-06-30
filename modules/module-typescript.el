;; module-typescript.el --- TypeScript.
(require 'evil)

(defun my/setup-tide-mode ()
  "Set up tide mode."
  (interactive)
  (setq company-tooltip-align-annotations t)
  (tide-setup)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1)
  )

(use-package typescript-mode)

(use-package tide
  :requires (aggressive-indent)
  :config
  (add-hook 'before-save-hook 'tide-format-before-save)
  (add-hook 'typescript-mode-hook 'my/setup-tide-mode)
  (add-to-list 'aggressive-indent-excluded-modes 'typescript-mode)
  (add-hook 'js2-mode-hook 'my/setup-tide-mode))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
  (lambda ()
    (when (string-equal "tsx" (file-name-extension buffer-file-name))
      (my/setup-tide-mode))))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)
(setq tide-tsserver-process-environment '("TSS_LOG=-level verbose -file /tmp/tss.log"))

(provide 'module-typescript)
;;; module-typescript.el ends here

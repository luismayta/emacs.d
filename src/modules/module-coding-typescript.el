;; module-coding-typescript.el --- TypeScript.
(require 'evil)

(use-package web-mode)

(defun configure-tide ()
  (interactive)

  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(use-package tide
  :commands tide-jump-to-definition
  :init
  (evil-define-key 'normal tide-mode-map
    (kbd "gd") 'tide-jump-to-definition
    (kbd "gD") 'tide-jump-back
    )
  )

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
  (lambda ()
    (when (string-equal "tsx" (file-name-extension buffer-file-name))
      (configure-tide))))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)
(setq tide-tsserver-process-environment '("TSS_LOG=-level verbose -file /tmp/tss.log"))

(provide 'module-coding-typescript)
;;; module-coding-typescript.el ends here

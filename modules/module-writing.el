;; typo
;; Mode for typographical editing.

(use-package typo
  :ensure t
  :diminish (typo-mode . " Ⓣ")
  :config
  (setq-default typo-language "English")
  (typo-global-mode 1)
  (dolist (hook '(markdown-mode-hook
                   rst-mode-hook
                   org-mode-hook
                   text-mode-hook))
    (add-hook hook 'typo-mode))
  )

;; flyspell spell checking.
(use-package flyspell
  :diminish flyspell-mode
  :commands flyspell-mode
  :init (add-hook 'text-mode-hook #'flyspell-mode)
  :config
  (setq ispell-extra-args '("--sug-mode=fast"))
  (setq flyspell-issue-message-flag nil)
  (setq flyspell-issue-welcome-flag nil))

;; markdown
(use-package markdown-mode
  :mode (("\\.md$" . markdown-mode)
          ("\\.text$" . markdown-mode)
          ("\\.markdown$" . markdown-mode)))

;; rst-mode
(use-package rst
  :config
  (add-hook 'rst-mode-hook
    (lambda ()
      (local-set-key (kbd "C-M-h") 'backward-kill-word)
      (turn-on-auto-fill)))
  :mode (("\\.rst$" . rst-mode)))

;; Install Apib-Mode
(use-package apib-mode
  :mode (("\\.apib$" . apib-mode)))

;; Double spaces at the end of sentences is a bit outdated.
(setq sentence-end-double-space nil)

(use-package super-save
  :init
  (super-save-mode)
  :config
  (setq super-save-auto-save-when-idle t)
  (setq auto-save-default nil))

(provide 'module-writing)
;;; module-writing.el ends here

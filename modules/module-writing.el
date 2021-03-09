;; flyspell spell checking.
;; (use-package flyspell
;;   :diminish flyspell-mode
;;   :commands flyspell-mode
;;   :init (add-hook 'text-mode-hook #'flyspell-mode)
;;   :config
;;   (setq ispell-extra-args '("--sug-mode=fast"))
;;   (setq flyspell-issue-message-flag nil)
;;   (setq flyspell-issue-welcome-flag nil))

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

(provide 'module-writing)
;;; module-writing.el ends here

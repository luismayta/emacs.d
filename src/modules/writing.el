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

;; Super Save, ON! ...or not.. 😬
(use-package super-save
  :disabled
  ;; Here's why:
  ;;  - lsp-mode added function signature docs which use lv
  ;;  - lv momentarily moves focus away from the buffer which triggers super-save
  ;;  - prettier-js-mode makes saves trigger prettier which edits the current line
  ;;  - edits to the current line by prettier move point to beginning of line
  ;;  - point is now at beginning of line so I can't type args in the function I just typed
  ;;
  ;; this is infuriating, but lsp signatures are (1) cool and (2) almost impossible to disable,
  ;; therefore I'm just disabling super-save for now until lsp-mode/lv/super-save work out their problems
  ;; See also https://github.com/emacs-lsp/lsp-mode/issues/1322
  :config
  (super-save-mode))

(provide 'module/writing)
;;; module/writing.el ends here

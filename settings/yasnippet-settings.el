;; Install packages

(bundle 'yasnippet nil)
(bundle 'yasnippet-bundle nil)

(require 'yasnippet)
(require 'yasnippet-bundle)

(use-package yasnippet
  :ensure t
  :init
  (add-hook 'after-init-hook 'yas-global-mode)
  (add-hook 'term-mode-hook #'force-yasnippet-off)
  (add-hook 'shell-mode-hook #'force-yasnippet-off)
  :config
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  (yas-reload-all)

  (defun do-yas-expand ()
    (let ((yas-fallback-behavior 'return-nil))
      (yas-expand)))

  (defun mb/handle-tab ()
    (interactive)
    (cond
     ((minibufferp)
      (minibuffer-complete))
     ((string= mode-name "Org")
      (when (null (do-yas-expand))
        (org-cycle)))
     ((string= mode-name "Magit")
      (magit-section-toggle (magit-current-section)))
     ((string= mode-name "Shell")
      (company-manual-begin))
     (t
      (indent-for-tab-command)
      (if (or (not yas-minor-mode)
              (null (do-yas-expand)))
          (auto-complete)))))

  (define-key yas-keymap [tab] 'mb/handle-tab)
  (define-key yas-keymap (kbd "TAB") 'mb/handle-tab)
  (bind-key* "TAB" 'mb/handle-tab))

;; functions

(defun force-yasnippet-off ()
  (setq-local yas-dont-activate t)
  (yas-minor-mode -1))

(provide 'yasnippet-settings)

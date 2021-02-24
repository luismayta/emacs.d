;; yasnippet configuration.
;; code:
(use-package yasnippet
  :ensure t
  :init
  ;; Ensure custom snippets dir exists.
  (defvar custom-snippets-dir (core/emacs.d "snippets/"))
  (core/mkdir-p custom-snippets-dir)
  ;; Replace default custom dir with our own.
  (setq yas-snippet-dirs '(custom-snippets-dir
                            yas-installed-snippets-dir))
  ;; Suppress excessive log messages
  (setq yas-verbosity 1)
  :bind
  (:map yas-minor-mode-map
    ("<tab>" . nil)
    ("TAB" . nil))
  :config
  (yas-global-mode)
  ;; Disable yasnippet in some modes.
  (defun yas-disable-hook ()
    (setq yas-dont-activate t))
  (add-hook 'term-mode-hook #'yas-disable-hook)
  (add-hook 'comint-mode-hook #'yas-disable-hook)
  (add-hook 'erc-mode-hook #'yas-disable-hook)

  (defun expand-for-web-mode ()
    (when (equal mode-name "Web")
      (make-local-variable 'yas-extra-modes)
      (setq yas-extra-modes
        (let ((web-lang (web-mode-language-at-pos)))
          (cond
            ((equal web-lang "html")       '(html-mode))
            ((equal web-lang "css")        '(css-mode))
            ((equal web-lang "javascript") '(javascript-mode))
            )))))

  (add-hook 'yas-before-expand-snippet-hook 'expand-for-web-mode)
  )

(provide 'module/snippets)
;;; module/snippets.el ends here

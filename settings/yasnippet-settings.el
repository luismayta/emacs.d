;; Install packages
;;; code:

(package-require 'yasnippet)

(require 'yasnippet)

(setq yas-snippet-dirs '(
        "~/.emacs.d/snippets" ;personal snippets
        ))
(setq
 yas-prompt-functions '(yas/ido-prompt yas/completing-prompt yas/x-prompt yas/dropdown-prompt yas/no-prompt)
 yas-indent-line 'auto)

(yas/global-mode t)
(yas/reload-all)

;; Remove Yasnippet's default tab key binding
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
;; Set Yasnippet's key binding to shift+tab
(define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand)
;; Alternatively use Control-c + tab
(define-key yas-minor-mode-map (kbd "\C-c TAB") 'yas-expand)

(message "loading all the snippets")
(add-hook 'prog-mode-hook #'yas-minor-mode)

(provide 'yasnippet-settings)

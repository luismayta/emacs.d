;; Install packages

(bundle 'yasnippet nil)
;; (bundle 'yasnippet-bundle nil)

(require 'yasnippet)
;; (require 'yasnippet-bundle)

(setq yas-snippet-dirs '(
        "~/.emacs.d/snippets" ;personal snippets
        ))
(setq
 yas-prompt-functions '(yas/ido-prompt yas/completing-prompt yas/x-prompt yas/dropdown-prompt yas/no-prompt)
 yas-indent-line 'auto)

(yas/global-mode t)
(yas/reload-all)

(message "loading all the snippets")
(add-hook 'prog-mode-hook #'yas-minor-mode)

(provide 'yasnippet-settings)

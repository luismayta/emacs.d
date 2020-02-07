;;; module-coding-js.el --- JavaScript and json configuration.
;;; Commentary:
;;; Code:

(use-package add-node-modules-path
  :hook ((js2-mode . add-node-modules-path)
          (web-mode . add-node-modules-path)
          (rjsx-mode . add-node-modules-path)
          ))

(use-package prettier-js
  :config
  (add-hook 'js2-mode-hook 'prettier-js-mode)
  (add-hook 'web-mode-hook 'prettier-js-mode)
  (add-hook 'rjsx-mode-hook 'prettier-js-mode)
  :ensure t  )

(use-package json-mode
  :ensure t
  :mode ("\\.json\\'" ".eslintrc\\'" ".prettierrc\\'" "Pipfile.lock\\'"))

(use-package js2-mode
  :mode
  (("\\.js$" . js2-mode)
    ("\\.jsx$" . js2-jsx-mode))
  :ensure t
  :hook ((js2-mode . (lambda ()
                       (flycheck-mode)
                       ))
          (js2-jsx-mode . (lambda ()
                            (flycheck-mode)
                            ))
          (js2-mode . add-node-modules-path)
          )
  :config
  ;; have 2 space indentation by default
  (setq js-indent-level 2
    js2-basic-offset 2
    js-chain-indent t))

;;; * Use Package indium: javascript awesome development environment
;;;;   - https://github.com/NicolasPetton/indium
(use-package indium
  :ensure t
  :after js2-mode
  :bind (:map js2-mode-map
          ("C-c C-l" . indium-eval-buffer)
          ("C-c C-n" . indium-run-node)
          ("C-c b l" . indium-list-breakpoints)
          ("C-c b K" . indium-remove-all-breakpoints-from-buffer)
          ("C-c b t" . indium-toggle-breakpoint))
  :hook ((js2-mode . indium-interaction-mode)))

(use-package js-auto-beautify
  :ensure t)

(use-package js-import
  :ensure t)

(use-package rjsx-mode
  :ensure t
  :mode "\\.jsx\\'"
  :magic ("/\\*\\* @jsx React\\.DOM \\*/" "^import React")
  :hook ((rjsx-mode . add-node-modules-path)))

(provide 'module-coding-js)
;;; module-coding-js.el ends here

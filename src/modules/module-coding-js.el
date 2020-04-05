;;; module-coding-js.el --- JavaScript and json configuration.
;;; Commentary:
;;; Code:

(use-package add-node-modules-path
  :hook ((js2-mode web-mode rjsx-mode) . add-node-modules-path))

;; Web modes
(use-package prettier-js
  :demand t ;; Was getting some weird load order errors, and I use it all the time, so just load it always
  :hook ((rjsx-mode yaml-mode css-mode json-mode typescript-mode) . prettier-js-mode))

(use-package json-mode
  :after prettier-js
  :ensure t
  :mode ("\\.json\\'" ".eslintrc\\'" ".prettierrc\\'" "Pipfile.lock\\'"))

(use-package js2-mode
  :after prettier-js
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
  )

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

(use-package jade-mode
  :mode ("\\.jade\\'" "\\.pug\\'"))

(use-package js-import
  :ensure t)

(use-package rjsx-mode
  :ensure t
  :mode "\\.jsx\\'"
  :magic ("/\\*\\* @jsx React\\.DOM \\*/" "^import React")
  :hook ((rjsx-mode . add-node-modules-path)))

(provide 'module-coding-js)
;;; module-coding-js.el ends here

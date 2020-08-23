;;; module-js.el --- JavaScript and json configuration.
;;; Commentary:
;;; Code:

(use-package add-node-modules-path
  :ensure t
  :hook ((js2-mode web-mode rjsx-mode) . add-node-modules-path))

;; Web modes
(use-package prettier-js
  :ensure t
  :hook ((rjsx-mode yaml-mode css-mode json-mode typescript-mode) . prettier-js-mode))

(use-package json-mode
  :requires (prettier-js)
  :ensure t
  :mode ("\\.json\\'" ".eslintrc\\'" ".prettierrc\\'" "Pipfile.lock\\'"))

(use-package jade-mode
  :mode ("\\.jade\\'" "\\.pug\\'"))

(use-package js-import
  :ensure t)

(use-package rjsx-mode
  :requires (add-node-modules-path)
  :ensure t
  :mode "\\.jsx\\'"
  :magic ("/\\*\\* @jsx React\\.DOM \\*/" "^import React")
  :hook ((rjsx-mode . add-node-modules-path)))

(provide 'module-js)
;;; module-js.el ends here

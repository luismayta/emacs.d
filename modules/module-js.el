;;; module-js.el --- JavaScript and json configuration.
;;; Commentary:
;;; Code:

(use-package add-node-modules-path
  :ensure t
  :hook ((js2-mode web-mode rjsx-mode) . add-node-modules-path))

(use-package json-mode
  :ensure t
  :mode ("\\.json\\'" ".eslintrc\\'" ".prettierrc\\'" "Pipfile.lock\\'"))

(use-package jade-mode
  :mode ("\\.jade\\'" "\\.pug\\'"))

(use-package rjsx-mode
  :requires (add-node-modules-path)
  :ensure t
  :mode "\\.jsx\\'"
  :magic ("/\\*\\* @jsx React\\.DOM \\*/" "^import React")
  :hook ((rjsx-mode . add-node-modules-path)))

(provide 'module-js)
;;; module-js.el ends here

;;; module-coding-js.el --- JavaScript and json configuration.
;;; Commentary:
;;; Code:

(require 'use-package)

(use-package json-mode
  :mode "\\.json$")

(use-package js2-mode
  :custom
  (sgml-basic-offset 2)
  (sgml-attribute-offset 0)
  (js-indent-level 2)
  (js-switch-indent-offset 2)
  (js2-basic-offset 2)
  (js2-strict-missing-semi-warning nil)
  (js2-missing-semi-one-line-override t)
  (js2-mode-show-parse-errors nil)
  (js2-mode-show-strict-warnings nil)
  (js2-mode-strict-inconsistent-return-warning nil)
  (js2-getprop-has-side-effects t)
  :config
  (add-to-list 'aggressive-indent-excluded-modes 'js2-mode))

(use-package js2-refactor
  :hook ((js2-mode . js2-refactor-mode)
          (web-mode . js2-refactor-mode))
  :config
  (js2r-add-keybindings-with-prefix "C-c C-r"))

(use-package rjsx-mode
  :pin melpa
  :mode "\\.jsx?\\'")

(use-package typescript-mode
  :mode "\\.tsx?\\'"
  :custom
  (typescript-indent-level 2))

(use-package lsp-mode
  :hook ((js2-mode . lsp)
          (typescript-mode . lsp))
  :custom
  (lsp-prefer-flymake nil))

(use-package company-lsp
  :config
  (push 'company-lsp company-backends))

(use-package tide
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
          (typescript-mode . tide-hl-identifier-mode)))

(use-package js-doc
  :bind (:map js2-refactor-mode-map
          ("C-c C-r i d" . js-doc-insert-function-doc)
          ("@" . js-doc-insert-tag))
  :custom
  (js-doc-mail-address "slovacus@gmail.com")
  (js-doc-author (format "Luis Mayta <%s>" js-doc-mail-address)))

(use-package add-node-modules-path
  :hook ((js2-mode . add-node-modules-path)
          (web-mode . add-node-modules-path)))

(use-package prettier-js
  :config
  (add-hook 'rjsx-mode-hook 'prettier-js-mode)
  (add-hook 'js2-mode-hook 'prettier-js-mode)
  (add-hook 'web-mode-hook 'prettier-js-mode))

;; parse node stack traces in compilation buffers
(require 'compile)
(add-to-list 'compilation-error-regexp-alist 'node)
(add-to-list 'compilation-error-regexp-alist-alist
  '(node "^[[:blank:]]*at \\(.*(\\|\\)\\(.+?\\):\\([[:digit:]]+\\):\\([[:digit:]]+\\)" 2 3 4))

(provide 'module-coding-js)
;;; module-coding-js.el ends here

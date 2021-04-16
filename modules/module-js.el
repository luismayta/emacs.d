;;; module-js.el --- JavaScript and json configuration.
;;; Commentary:
;;; Code:

(use-package json-mode
  :ensure t
  :ensure-system-package
  (
    (vscode-json-languageserver . "yarn global add vscode-json-languageserver")
    )
  :mode ("\\.json\\'" ".eslintrc\\'" ".prettierrc\\'" "Pipfile.lock\\'")
  )

(use-package jade-mode
  :mode ("\\.jade\\'" "\\.pug\\'"))

(use-package rjsx-mode
  :requires (add-node-modules-path)
  :ensure t
  :mode ("\\.js\\'"
          "\\.jsx\\'")
  :magic ("/\\*\\* @jsx React\\.DOM \\*/" "^import React")
  :config
  (setq js2-mode-show-parse-errors nil
    js2-mode-show-strict-warnings nil
    js2-basic-offset 2
    js-indent-level 2)
  (setq-local flycheck-disabled-checkers (cl-union flycheck-disabled-checkers
                                           '(javascript-jshint))) ; jshint doesn't work for JSX
  (add-hook 'js2-mode-hook #'lsp-format-onsave-hook)

  (electric-pair-mode 1)
  )

(use-package typescript-mode
  :ensure t
  :mode (("\\.ts\\'" . typescript-mode)
          ("\\.tsx\\'" . typescript-mode))
  :ensure-system-package
  (
    (tsserver . "yarn global add typescript-language-server")
    )
  :config
  (setq-default typescript-indent-level 2)
  ;; (add-hook 'typescript-mode-hook #'lsp-format-onsave-hook)
  )

(use-package add-node-modules-path
  :ensure t
  :defer t
  :hook (((js2-mode rjsx-mode) . add-node-modules-path)))

(use-package prettier-js
  :defer t
  :ensure-system-package
  (
    (prettier . "yarn global add prettier")
    )
  :diminish prettier-js-mode
  :hook (((js2-mode rjsx-mode) . prettier-js-mode)))

(provide 'module-js)
;;; module-js.el ends here

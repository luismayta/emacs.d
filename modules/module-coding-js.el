;; module-coding-js.el --- JavaScript and json configuration.

(use-package json-mode
  :mode "\\.json$")

;; (use-package rjsx-mode
;;   :mode "\\.js$"
;;   :config
;;   (map! :map rjsx-mode-map
;; 	  (:localleader
;; 	    :n  "j" #'tide-jump-to-definition
;; 	    :n  "J" #'tide-jump-to-implementation
;; 	    :n  "b" #'tide-jump-back
;; 	    :n  "d" #'tide-documentation-at-point
;; 	    :n  "r" #'tide-rename-symbol
;; 	    :n  "g" #'tide-nav
;; 	    :n  "i" #'tide-organize-imports
;; 	    :n  "u" #'tide-references
;; 	    :n  "f" #'tide-fix
;; 	    (:desc "html" :prefix "h"
;; 	      :n "r" #'rjsx-rename-tag-at-point
;; 	      :n "t" #'js2-mode-toggle-element)))
;;   (setq js2-basic-offset 2)
;;   (define-key evil-insert-state-map (kbd "C-d") nil)
;;   (add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode)))

;; (defun setup-tide-mode ()
;;   "Set up Tide mode."
;;   (interactive)
;;   (tide-setup)
;;   (eldoc-mode +1)
;;   (tide-hl-identifier-mode +1)
;;   ;;testing 1
;;   (setq tide-completion-detailed t))

;; (use-package tide
;;   :after (:any web-mode rjsx-mode typescript-mode)
;;   :config
;;   (setq company-tooltip-align-annotations t
;; 	  tide-completion-detailed t
;;     tide-always-show-documentation t)
;;   (add-hook 'rjsx-mode-hook #'setup-tide-mode)
;;   (add-hook 'typescript-mode-hook #'setup-tide-mode)

;;   (setq-default flycheck-disabled-checker 'javascript-jshint)
;;   (flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)
;;   (flycheck-add-mode 'typescript-tslint 'web-mode)
;;   (flycheck-add-mode 'typescript-tslint 'typescript-mode)
;;   (flycheck-add-mode 'javascript-eslint 'web-mode)
;;   (flycheck-add-mode 'javascript-eslint 'rjsx-mode))

;; (use-package add-node-modules-path
;;   :after rjsx-mode)

;; (use-package prettier-js
;;   :after (rjsx-mode add-node-modules-path typescript-mode)
;;   :hook (rjsx-mode . add-node-modules-path) ;;use project prettier
;;   :hook (rjsx-mode . prettier-js-mode)
;;   :hook (typescript-mode . add-node-modules-path)
;;   :hook (typescript-mode . prettier-js-mode)
;;   :hook (less-css-mode . add-node-modules-path)
;;   :hook (less-css-mode . prettier-js-mode))

;; (use-package js2-refactor
;;   :after rjsx-mode
;;   :config
;;   (add-hook 'rjsx-mode-hook #'js2-refactor-mode))

;; (use-package typescript-mode
;;   :mode "\\.ts$")

(use-package js2-mode
  :ensure t
  :init
  (defun js2-mode-load-config ()
    (advice-add 'js--multi-line-declaration-indentation :around (lambda (orig-fun &rest args) nil))
    (setq js2-strict-missing-semi-warning nil)
    (define-key js2-mode-map (kbd "M-.") 'xref-find-definitions)
    (set-face-attribute 'js2-warning nil
      :underline "yellow")
    (set-face-attribute 'js2-error nil
      :underline "red"))
  (add-hook 'js2-mode-hook 'js2-mode-load-config)

  (use-package rjsx-mode
    :ensure t
    :init
    (add-to-list 'auto-mode-alist '("\\.jsx\\'" . rjsx-mode))
    (add-to-list 'auto-mode-alist '("\\.react.js\\'" . rjsx-mode))
    (add-to-list 'auto-mode-alist '("\\index.android.js\\'" . rjsx-mode))
    (add-to-list 'auto-mode-alist '("\\index.ios.js\\'" . rjsx-mode))
    (add-to-list 'magic-mode-alist '("/\\*\\* @jsx React\\.DOM \\*/" . rjsx-mode))
    (add-to-list 'magic-mode-alist '("^import React" . rjsx-mode))
    (add-hook 'rjsx-mode-hook 'js2-mode-load-config))

  (use-package add-node-modules-path
    :ensure t
    :init
    (add-hook 'js-mode-hook #'add-node-modules-path))

  ;; (use-package prettier-js
  ;;   :ensure t
  ;;   :init
  ;;   (add-hook 'js-mode-hook #'prettier-js-mode))

  (add-hook 'js2-mode-hook #'js2-imenu-extras-mode)
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))


(provide 'module-coding-js)
;;; module-coding-js.el ends here

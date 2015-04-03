;;requires modules
(require 'go-eldoc) ;; Don't need to require, if you install by package.el
(require 'go-mode) ;; Don't need to require, if you install by package.el

(add-hook 'go-mode-hook 'go-eldoc-setup)

(set-face-attribute 'eldoc-highlight-function-argument nil
                    :underline t :foreground "green"
                                        :weight 'bold)

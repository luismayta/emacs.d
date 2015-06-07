(bundle 'noctilux-theme nil)
(bundle 'subatomic256-theme nil)

;;; -- Config
;; make pretty colors
(add-to-list 'custom-theme-load-path "~/.emacs.d/lib/color-themes")
(load-theme 'noctilux t)

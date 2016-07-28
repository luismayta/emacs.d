;; Install Packages

(bundle 'undo-tree nil)

(require 'undo-tree)

(global-undo-tree-mode 1)
(defalias 'redo 'undo-tree-redo)

(provide 'undo-tree-settings)

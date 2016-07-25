;; Install Packages

(el-get-install 'undo-tree)

(require 'undo-tree)

global-undo-tree-mode 1)
(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-S-z") 'redo)

(provide 'undo-tree-settings)

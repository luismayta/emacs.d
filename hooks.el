;; Hooks Functions
(provide 'functions.el)
(require 'whitespace)

(add-hook 'compilation-finish-functions 'bury-compile-buffer-if-successful)

(add-hook 'before-save-hook 'hook-save-buffer)
;; (add-hook 'before-save-hook 'whitespace-cleanup)

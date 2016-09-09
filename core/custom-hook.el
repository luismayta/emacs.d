;----------------------;
;;; Custom Hooks     ;;;
;----------------------;

(require 'whitespace)

(add-hook 'compilation-finish-functions 'bury-compile-buffer-if-successful)

(add-hook 'before-save-hook 'hook-save-buffer)

(provide 'custom-hook)

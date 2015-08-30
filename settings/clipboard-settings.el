;--------------------------------;
;;;    Clipboard Settings      ;;;
;--------------------------------;

;; Install Packages
(bundle 'osx-clipboard nil)

(require 'osx-clipboard)

(osx-clipboard-mode t)

(provide 'clipboard-settings)

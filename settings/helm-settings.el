;--------------------------------;
;;;    Helm Settings           ;;;
;--------------------------------;

;; Install Packages
(bundle 'helm nil)
(bundle 'helm-descbinds nil)

(require 'helm)
(require 'helm-descbinds)

(fset 'describe-bindings 'helm-descbinds)
(helm-mode t)

(global-set-key (kbd "C-c h") 'helm-mini)

(provide 'helm-settings)

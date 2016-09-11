;--------------------------------;
;;;    Helm Settings           ;;;
;--------------------------------;

;;; code:
(package-require 'helm)
(package-require 'helm-descbinds)

(require 'helm)
(require 'helm-descbinds)

(fset 'describe-bindings 'helm-descbinds)
(helm-mode t)

(global-set-key (kbd "C-c h") 'helm-mini)

(provide 'helm-settings)

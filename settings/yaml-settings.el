;; Install Packages
;;; code:
(package-require 'yaml-mode)

(require 'yaml-mode)

(defun yaml-mode-hook ()
  (autoload 'yaml-mode "yaml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode)))

(provide 'yaml-settings)

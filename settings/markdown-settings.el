;-------------------;
;;; Markdown mode ;;;
;-------------------;

;; Install Packages
(bundle 'markdown-mode nil)
;; Config
(require 'cl)
(require 'markdown-mode)

(defun markdown-mode-hook ()
  (autoload 'markdown-mode "markdown-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.text$" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
  )

(provide 'markdown-settings)

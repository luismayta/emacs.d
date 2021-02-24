;;; core-load.el --- def vars.
;;; code:

(require 'core-vars)

(defun add-to-load-path (dir) (add-to-list 'load-path dir)
  )

(defun add-to-load-path-if-exists (dir)
  "If DIR exists in the file system, add it to `load-path'."
  (when (file-exists-p dir)
    (add-to-load-path dir))
  )

;; load paths libraries
(mapc 'add-to-load-path
  `(
     ,core-directory
     ,config-directory
     ,module-directory
     ,elisp-directory
     ,themes-directory
     ))

(provide 'core-load)
;;; core-load ends here

;;; core/load-paths.el --- def vars.
;;; code:

(defun add-to-load-path (dir) (add-to-list 'load-path dir)
  )

(defun add-to-load-path-if-exists (dir)
  "If DIR exists in the file system, add it to `load-path'."
  (when (file-exists-p dir)
    (add-to-load-path dir))
  )

;; load paths
(mapc 'add-to-load-path
  `(
     ,core-directory
     ,modules-directory
     ,elisp-directory
     ,themes-directory
     ))

(provide 'core/load-paths)
;;; core/load-paths ends here

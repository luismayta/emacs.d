;;; core-vars.el --- def vars.

;;; code:

(defvar core/fixed-font-name "Fira Code")
(defvar core/fixed-font-weight 'normal)
(defvar core/var-font-name "Fira Code")
(defvar core/font-height 150)

(defvar private-dir  (expand-file-name "private" user-emacs-directory))
(defvar temp-dir
  (format "%s/cache" private-dir)
  "Hostname-based elisp temp directories.")

;; vars for terminals.
(defvar my-term-shell "/bin/zsh")

(provide 'core-vars)
;;; core-vars.el ends here

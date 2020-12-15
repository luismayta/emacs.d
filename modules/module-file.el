;;; module-file.el --- files mode.
;;; code:

(use-package vimrc-mode
  :mode (("/\\.vimrc\\'" . vimrc-mode)
          ("/vimrc\\'" . vimrc-mode)
          ("\\.vim\\'" . vimrc-mode)))

(use-package syslog-mode :mode "/var/log.*\\'")

(provide 'module-file)
;;; module-file.el ends here

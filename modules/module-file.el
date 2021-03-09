;;; module-file.el --- file mode config.
;;; code:

(use-package vimrc-mode
  :quelpa (vimrc-mode :fetcher github
		   :repo "mcandre/vimrc-mode")
  :mode (("\\.vim\\(rc\\)?\\'" . vimrc-mode)
          ("\\vimrc\\'" . vimrc-mode)))

(use-package syslog-mode :mode "/var/log.*\\'")

(provide 'module-file)
;;; module-file.el ends here

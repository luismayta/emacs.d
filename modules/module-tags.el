;;; module-tags.el --- Display and appearance related settings.

(defun helm-gtags-maybe-dwim ()
  "Runs `helm-gtags-dwim' if `gtags-enable-by-default' is on.
Otherwise does nothing."
  (interactive)
  (when gtags-enable-by-default
    (call-interactively 'helm-gtags-dwim)))

(defun ggtags-mode-enable ()
  "Enable ggtags and eldoc mode.
  For eldoc, ggtags advises the eldoc function at the lowest priority
  so that if the major mode has better support it will use it first."
  (when gtags-enable-by-default
    (ggtags-mode 1)
    (eldoc-mode 1)))

;;; code:
(use-package ggtags
  :defer t
  :init
  (progn
    (add-hook 'awk-mode-local-vars-hook #'ggtags-mode-enable)
    (add-hook 'shell-mode-local-vars-hook #'ggtags-mode-enable)
    (add-hook 'tcl-mode-local-vars-hook #'ggtags-mode-enable)
    (add-hook 'vhdl-mode-local-vars-hook #'ggtags-mode-enable))
  :config
  (define-key ggtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
  (define-key ggtags-mode-map (kbd "C-x 4 .") 'helm-gtags-find-tag-other-window)
  (define-key ggtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
  (define-key ggtags-mode-map (kbd "M-*") 'helm-gtags-pop-stack))

(use-package helm-gtags
  :defer t
  :init
  (progn
    (setq helm-gtags-ignore-case t
      helm-gtags-auto-update t
      helm-gtags-use-input-at-cursor t
      helm-gtags-pulse-at-cursor t)))

(provide 'module-tags)
;;; module-tags.el ends here

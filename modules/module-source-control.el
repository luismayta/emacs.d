;;; module-source-control.el --- Source control and related configuration.

;; gist.el
;; Provides ability to create github gists from region, file, etc., as well as
;; browse, edit, and update metadata of your gists.
(use-package gist
  :requires (evil-leader)
  :init
  (evil-leader/set-key "gl" 'gist-list)
  (evil-leader/set-key "gb" 'gist-buffer)
  :config
  (setq gist-view-gist t))

;; Emacs Git integration
(use-package magit
  :ensure t
  :config
  (add-hook 'magit-mode-hook
	    (lambda ()
	      (define-key magit-mode-map (kbd ",o") 'delete-other-windows))))

(use-package diff-hl
  :ensure t
  :config
  (global-diff-hl-mode 1)
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh))



(provide 'module-source-control)
;;; module-source-control.el ends here

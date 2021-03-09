;;; module-source-control.el --- Source control and related configuration.

;; Disable since I use magit for everything.
(setq vc-handled-backends '())
(remove-hook 'find-file-hooks 'vc-find-file-hook)

;; gist.el
;; Provides ability to create github gists from region, file, etc., as well as
;; browse, edit, and update metadata of your gists.
(use-package gist
  :requires (evil-leader)
  :bind ("C-c g p" . gist-region-or-buffer-private)
  :init
  (evil-leader/set-key "gl" 'gist-list)
  (evil-leader/set-key "gb" 'gist-buffer)
  :config
  (setq gist-view-gist t))

;; Modes for git and mercurial.
(use-package magit
  :quelpa (magit :fetcher github
		   :repo "magit/magit")
  :requires (evil-leader)
  :commands magit-status
  :config
  ;; Full-screen magit status with restore.
  (defadvice magit-status (around magit-fullscreen activate)
    (window-configuration-to-register :magit-fullscreen)
    ad-do-it
    (delete-other-windows))
  (defadvice magit-mode-quit-window (around magit-restore-screen activate)
    ad-do-it
    (jump-to-register :magit-fullscreen))
  :init
  (evil-leader/set-key "gs" 'magit-status)
  (evil-leader/set-key "gc" 'magit-commit)
  )

;; Info git gutter
(use-package git-gutter
  :ensure t
  :diminish git-gutter-mode
  :config (global-git-gutter-mode)
  :init
  (progn
    (setq git-gutter:separator-sign " "
      git-gutter:lighter " GG"))
  :config
  (progn
    (set-face-background 'git-gutter:deleted "#990A1B")
    (set-face-foreground 'git-gutter:deleted "#990A1B")
    (set-face-background 'git-gutter:modified "#00736F")
    (set-face-foreground 'git-gutter:modified "#00736F")
    (set-face-background 'git-gutter:added "#546E00")
    (set-face-foreground 'git-gutter:added "#546E00"))
  :bind (("C-x p" . git-gutter:previous-hunk)
          ("C-x n" . git-gutter:next-hunk)
          ("C-x v =" . git-gutter:popup-hunk)
          ("C-x v r" . git-gutter:revert-hunk)))

(use-package gitignore-mode)

(provide 'module-source-control)
;;; module-source-control.el ends here

;;; module-source-control.el --- Source control and related configuration.

;; Disable since I use magit for everything.
(setq vc-handled-backends '())
(remove-hook 'find-file-hooks 'vc-find-file-hook)

(use-package git-timemachine)

;; gist.el
;; Provides ability to create github gists from region, file, etc., as well as
;; browse, edit, and update metadata of your gists.
(use-package gist
  :bind ("C-c g p" . gist-region-or-buffer-private)
  :config
  (setq gist-view-gist t))

(defun process-exit-code-and-output (program &rest args)
  "Run PROGRAM with ARGS and return the exit code and output in a list."
  (with-temp-buffer
    (list (apply 'call-process program nil (current-buffer) nil args)
          (buffer-string))))

(defun lm/magit-or-monky-status ()
  "Call `magit-status' or `monky-status' depending on whether a
git or hg repository is found in the buffer-local working dir."
  (interactive)
  (cond
   ((eq (car (process-exit-code-and-output "hg" "status")) 0)
    (monky-status))
   ((eq (car (process-exit-code-and-output "git" "status")) 0)
    (call-interactively 'magit-status))
   (t (message "No hg or git repository found at %s" default-directory))))

;; magit and monky
;; Modes for git and mercurial.
(use-package magit
  :commands magit-status
  :bind ("C-x g" . lm/magit-or-monky-status)
  :config
  ;; Full-screen magit status with restore.
  (defadvice magit-status (around magit-fullscreen activate)
    (window-configuration-to-register :magit-fullscreen)
    ad-do-it
    (delete-other-windows))
  (defadvice magit-mode-quit-window (around magit-restore-screen activate)
    ad-do-it
    (jump-to-register :magit-fullscreen))
  ;; Use flyspell during commits.
  (add-hook 'git-commit-mode-hook '(lambda () (flyspell-mode t)))
  :init
  (evil-leader/set-key "gs" 'magit-status)
  (evil-leader/set-key "gc" 'magit-commit)
  ;; (evil-leader/set-key "gd" 'magit-diff)
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

(use-package monky
  :commands monky-status
  :config
  ;; Similar full-screen config for monky.
  (defadvice monky-status (around monky-fullscreen activate)
    (window-configuration-to-register :monky-fullscreen)
    ad-do-it
    (delete-other-windows))
  (defadvice monky-quit-window (around monky-restore-screen activate)
    ad-do-it
    (jump-to-register :monky-fullscreen))
  ;; Flyspell during commits.
  (add-hook 'monky-log-edit-mode-hook '(lambda () (flyspell-mode t))))


(use-package gitignore-mode)

(provide 'module-source-control)
;;; module-source-control.el ends here

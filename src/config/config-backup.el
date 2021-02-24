;;; config-backup --- settings for backups.
;; Emacs configuration

;; Auto-save and backup parameters.

;; Auto-save after 20 seconds of inactivity, or after 200 characters typed, if
;; the buffer is modified.
(setq-default auto-save-timeout 20
  auto-save-interval 200)

;; Backup parameters.
(setq-default backup-by-copying t
	delete-old-versions t
	kept-new-versions 2
	kept-old-versions 2
	version-control t
	vc-make-backup-files t)


(provide 'config-backup)
;;; config-backup ends here

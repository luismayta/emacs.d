;;; core-defaults --- defaults.
;;; code:

(require 'core-defuns)

;; Ignore customisation by putting it in the cache dir.
(setq custom-file (core/cache-for "custom.el"))

;; Fix mac-port defaults.
(when (equal system-type 'darwin)
  (setq mac-option-modifier 'meta)
  (setq mac-command-modifier 'super)
  (global-set-key [(super v)] 'yank)
  (global-set-key [(super q)] 'save-buffers-kill-emacs))

;; Frame title formatting.
(setq-default frame-title-format
              '((:eval (if (buffer-file-name)
                           (abbreviate-file-name (buffer-file-name))
                         "%b"))))

;; Character encodings default to utf-8.
(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

;; Show column numbers in mode line.
(setq column-number-mode t)
;; Show linum mode
(global-linum-mode t)

;; the menu bar is pointless in a terminal
(menu-bar-mode -1)

;; don't show the tool bar when in a gui
(when (featurep 'tool-bar)
  (tool-bar-mode -1))

;Highlight the current line
(global-hl-line-mode 1)

;; reload changes from disk
(global-auto-revert-mode t)

;; Never ring the bell. Never.
(setq ring-bell-function (lambda()))

;; Don't disable any commands (e.g. `upcase-region').
(setq disabled-command-function nil)

;; Don't use dialog boxes.
(setq use-dialog-box nil)

;; Hide mouse while typing.
(setq make-pointer-invisible t)

;; Reduce keystroke echo delay.
(setq echo-keystrokes 0.001)

;; Enable y/n answers.
(fset 'yes-or-no-p 'y-or-n-p)

;; Automatically scroll compilation window.
(setq compilation-scroll-output 1)

(core/mkdir-p (core/emacs.d "var/cache"))
(core/mkdir-p (core/emacs.d "etc"))
(core/mkdir-p (core/cache-for "backups"))

;; Keep backups in a separate directory.
(defun make-backup-file-name (file)
  (concat (core/cache-for "backups/") (file-name-nondirectory file) "~"))

;; Keep autosave files in /tmp.
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Change auto-save-list directory.
(setq auto-save-list-file-prefix (core/cache-for "auto-save-list/.saves-"))

;; Change eshell directory.
(setq eshell-directory-name (core/cache-for "eshell"))

;; Disable annoying lock files.
(setq create-lockfiles nil)

;; Change bookmarks file location.
(setq bookmark-file (core/emacs.d "etc/bookmarks"))

;; Change save-places file location.
(setq save-place-file (core/cache-for "places"))

;; Ido history.
(setq ido-save-directory-list-file (core/cache-for "ido.last"))

;; Allow pasting selection outside of Emacs.
(setq x-select-enable-clipboard t)

;; Move files to trash when deleting
(setq delete-by-moving-to-trash t)

;; Ignore case for completion.
(setq completion-ignore-case t
      read-file-name-completion-ignore-case t)

;; When copying something from outside emacs, save to kill-ring.
(setq save-interprogram-paste-before-kill t)

;; Dired defaults.
;; Prefer g-prefixed coreutils version of standard utilities when available
(let ((gls (executable-find "gls")))
  (when gls (setq insert-directory-program gls)))
(setq-default dired-listing-switches "-lhva")
(setq-default dired-clean-up-buffers-too t)
(setq-default dired-recursive-copies 'always)
(setq-default dired-recursive-deletes 'top)

;; Misc.
(setq inhibit-startup-message t)
(global-font-lock-mode t)

(provide 'core-defaults)

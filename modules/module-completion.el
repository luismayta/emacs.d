;;; module-completion.el --- Company config               -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Luis Mayta

;; Keywords: autocomplete

;;; Commentary:

;; Search, navigation, and completion:
;; this module includes
;;   - ivy
;;   - counsel
;;   - which-key
;;   - avy
;;   - YaSnippet
;;   - company

;;; Code:


;; Ivy (taken from "How to make your own Spacemacs")
(use-package ivy
  :ensure t
  :diminish (ivy-mode . "") ; does not display ivy in the modeline
  :init (ivy-mode 1)        ; enable ivy globally at startup
  :config
  (setq ivy-use-virtual-buffers t)   ; extend searching to bookmarks and …
  (setq ivy-height 10)               ; set height of the ivy window
  (setq ivy-count-format "(%d/%d) ") ; count format, from the ivy help page
  )

;; Counsel (same as Ivy above)
(use-package counsel
  :ensure t
  :requires (evil-leader)
  :init
  (evil-leader/set-key "/" 'counsel-grep)
  :commands          ; Load counsel when any of these commands are invoked
  (counsel-M-x       ; M-x use counsel
    counsel-find-file ; C-x C-f use counsel-find-file
    counsel-recentf   ; search recently edited files
    counsel-git       ; search for files in git repo
    counsel-git-grep  ; search for regexp in git repo
    counsel-ag        ; search for regexp in git repo using ag
    counsel-locate)   ; search for files or else using locate
  )

(use-package company
  :ensure t
  :config (progn
            ;; don't add any dely before trying to complete thing being typed
            ;; the call/response to gopls is asynchronous so this should have little
            ;; to no affect on edit latency
            (setq company-idle-delay 0)
            ;; start completing after a single character instead of 3
            (setq company-minimum-prefix-length 2)
            ;; align fields in completions
            (setq company-tooltip-align-annotations t)
            )
  )

;; optional package to get the error squiggles as you edit
(use-package flycheck
  :ensure t)

;; if you use company-mode for completion (otherwise, complete-at-point works out of the box):
(use-package company-lsp
  :ensure t
  ;;:after(company lsp-mode)
  :commands company-lsp)

(use-package company-box
  :requires (lsp-mode)
  :ensure t
  :hook
  (lsp-mode . company-box-mode)
  (emacs-lisp-mode . company-box-mode))

(provide 'module-completion)
;;; module-completion.el ends here

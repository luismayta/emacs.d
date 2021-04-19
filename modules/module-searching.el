;; ag (silver surfer)
(use-package ag
  :bind ("C-c s" . ag)
  :config (setq ag-highlight-search t))

;; engine
;; Search engines integrated into Emacs.
(use-package engine-mode
  :requires (evil-leader)
  :commands (engine/search-github engine/search-google)
  :bind (("C-c / g" . engine/search-google)
          ("C-c / h" . engine/search-github))
  :config
  (setq engine/browser-function 'eww-browse-url)
  (defengine github
    "https://github.com/search?ref=simplesearch&q=%s"
    :keybinding "h")
  (defengine google
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
    :keybinding "g")
  :init
  (evil-leader/set-key "gg" 'engine/search-google)
  (evil-leader/set-key "gh" 'engine/search-github)
  )

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
  :custom
  (ivy-mode 1)
  (counsel-mode 1)
  :requires (evil-leader)
  :hook
  ;; invoke counsel-mode to remaps built-ins to counsel counterparts
  (ivy-mode . counsel-mode)
  :init
  (evil-leader/set-key "/" 'counsel-grep)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  :commands          ; Load counsel when any of these commands are invoked
  (counsel-M-x       ; M-x use counsel
    counsel-find-file ; C-x C-f use counsel-find-file
    counsel-recentf   ; search recently edited files
    counsel-git       ; search for files in git repo
    counsel-git-grep  ; search for regexp in git repo
    counsel-ag        ; search for regexp in git repo using ag
    counsel-locate)   ; search for files or else using locate
  )

(use-package all-the-icons-ivy
  :after (ivy all-the-icons)
  :init (add-hook 'after-init-hook 'all-the-icons-ivy-setup)
  :config
  (setq all-the-icons-ivy-icon-args (list :height 0.8 :v-adjust -0.4))
  (setq all-the-icons-ivy-file-commands
    '(counsel-find-file counsel-file-jump counsel-recentf counsel-projectile-find-file counsel-projectile-find-dir)))

(use-package all-the-icons-ivy-rich
  :hook
  (ivy-mode . all-the-icons-ivy-rich-mode)
  :custom
  (all-the-icons-ivy-rich-icon-size 0.8))

(use-package ivy-rich
  :hook
  (ivy-mode . ivy-rich-mode))

(provide 'module-searching)
;;; module-searching.el ends here

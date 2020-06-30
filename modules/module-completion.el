;;; module-completion.el --- Company config               -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Luis Mayta

;; Keywords: autocomplete

;;; Commentary:

;; Search, navigation, and completion:
;; this module includes
;;   - ivy
;;   - counsel
;;   - swiper
;;   - which-key
;;   - avy
;;   - YaSnippet
;;   - company

;;; Code:

(use-package auto-complete
  :config
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
  (ac-set-trigger-key "TAB")
  (ac-set-trigger-key "<tab>")
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

;; Swiper
(use-package swiper
  :ensure t
  :commands swiper
  )

;; Which key
(use-package which-key
  :ensure t
  :init
  (which-key-mode)
  :config
  (which-key-setup-side-window-bottom)
  (setq which-key-sort-order 'which-key-key-order-alpha
    which-key-side-window-max-width 0.00
    which-key-idle-delay 0.00)
  :diminish which-key-mode
  )

;; Auto completion
(use-package company-anaconda
  :after (anaconda-mode company)
  :commands company-anaconda
  :config (add-to-list 'company-backends 'company-anaconda))

(use-package company
  :bind (("<C-tab>" . company-complete))
  :init
  (setq company-idle-delay 0.5
    company-show-numbers t
    company-tooltip-limit 10
    company-minimum-prefix-length 2
    company-tooltip-flip-when-above t)
  :config
  (use-package company-emoji
    :init
    (add-to-list 'company-backends 'company-emoji))
  (use-package company-web-html
    :ensure company-web
    :init
    (add-to-list 'company-backends 'company-web-html))
  (company-tng-configure-default)
  (global-company-mode 1))

(provide 'module-completion)
;;; module-completion.el ends here

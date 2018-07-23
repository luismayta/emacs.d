;;; module-ui.el --- UI niceties.

;; uniquify
;; Overrides Emacs' default mechanism for making buffer names unique.
(use-package uniquify
  :ensure nil
  :config (setq uniquify-buffer-name-style 'forward))


;; ido
(use-package ido
  :ensure flx-ido
  :ensure ido-ubiquitous
  :init (ido-mode 1)
  :config
  (use-package ido-vertical-mode
    :config
    (setq ido-vertical-define-keys 'C-n-and-C-p-only))
  (add-to-list 'ido-ignore-files "\\.DS_Store")
  (setq ido-enable-flex-matching t
    ido-ignore-buffers  '("\\` "  "^\*Back" ".*Completions\*" "^\*Ido" "^\*trace"
                           "^\*compilation" "^\*GTAGS" "^session\.*")
    ido-enable-prefix nil
    ido-use-url-at-point nil
    ido-max-prospects 10
    ido-use-faces nil
    flx-ido-use-faces t)
  (ido-everywhere 1)
  (ido-vertical-mode 1)
  (flx-ido-mode 1))

;; smex
(use-package smex
  :bind (("M-x" . smex)
          ("M-X" . smex-major-mode-commands)
          ("C-x C-m" . smex)
          ("C-c C-m" . smex))
  :init (setq smex-save-file (core/cache-for "smex-items"))
  :config (smex-initialize))

;; diminish some modes.
(use-package simple
  :ensure nil
  :diminish visual-line-mode)

;; get rid of the mouse.
(use-package avoid
  :if window-system
  :defer 10
  :config
  (mouse-avoidance-mode 'exile))

(use-package neotree
  :commands (neotree-show
              neotree-hide
              neotree-toggle
              neotree-dir
              neotree-find
              neo-global--with-buffer
              neo-global--window-exists-p)
  :config
  (add-hook 'neotree-mode-hook
    (lambda ()
      (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))
  (setq neo-create-file-auto-open nil
    neo-auto-indent-point nil
    neo-autorefresh nil
    neo-mode-line-type 'none
    neo-window-width 25
    neo-show-updir-line nil
    neo-theme 'icons
    neo-smart-open t
    neo-banner-message nil
    neo-confirm-create-file #'off-p
    neo-confirm-create-directory #'off-p
    neo-show-hidden-files nil
    neo-keymap-style 'concise
    neo-hidden-regexp-list
    '(;; vcs folders
       "^\\.\\(git\\|hg\\|svn\\)$"
       ;; compiled files
       "\\.\\(pyc\\|o\\|elc\\|lock\\|css.map\\)$"
       ;; generated files, caches or local pkgs
       "^\\(node_modules\\|vendor\\|.\\(project\\|cask\\|yardoc\\|sass-cache\\)\\)$"
       ;; org-mode folders
       "^\\.\\(sync\\|export\\|attach\\)$"
       "~$"
       "^#.*#$")

    )
  (progn
    (evil-define-key 'normal neotree-mode-map (kbd "g") 'nil)
    (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
    (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
    (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
    (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
    (evil-define-key 'normal neotree-mode-map (kbd "BACKSPACE") 'evil-window-prev)
    (evil-define-key 'normal neotree-mode-map (kbd "c") 'neotree-create-node)
    (evil-define-key 'normal neotree-mode-map (kbd "r") 'neotree-rename-node)
    (evil-define-key 'normal neotree-mode-map (kbd "d") 'neotree-delete-node)
    (evil-define-key 'normal neotree-mode-map (kbd "j") 'neotree-next-line)
    (evil-define-key 'normal neotree-mode-map (kbd "k") 'neotree-previous-line)
    (evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-next-line)
    (evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-previous-line)
    (evil-define-key 'normal neotree-mode-map (kbd "h") '+neotree/collapse-or-up)
    (evil-define-key 'normal neotree-mode-map (kbd "l") '+neotree/expand-or-open)
    (evil-define-key 'normal neotree-mode-map (kbd "J") 'neotree-select-next-sibling-node)
    (evil-define-key 'normal neotree-mode-map (kbd "K") 'neotree-select-previous-sibling-node)
    (evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-select-up-node)
    (evil-define-key 'normal neotree-mode-map (kbd "L") 'neotree-select-down-node)
    (evil-define-key 'normal neotree-mode-map (kbd "G") 'evil-goto-line)
    (evil-define-key 'normal neotree-mode-map (kbd "gg") 'evil-goto-first-line)
    (evil-define-key 'normal neotree-mode-map (kbd "v") 'neotree-enter-vertical-split)
    (evil-define-key 'normal neotree-mode-map (kbd "s") 'neotree-enter-horizontal-split)
    (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
    (evil-define-key 'normal neotree-mode-map (kbd "R") 'neotree-refresh)
    )
  :init
  (evil-leader/set-key "n" 'neotree-toggle)
  (use-package	all-the-icons
    :ensure t)
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  ;; execute old project switch action and set
  ;; neotree root to project root
  ;; (with-eval-after-load 'projectile
  ;;   (setq projectile-switch-project-action
  ;;     `(lambda ()
  ;;        (,projectile-switch-project-action)
  ;;        (neotree-projectile-action)
  ;;        (other-window -1))))
  )

(provide 'module-ui)
;;; module-ui.el ends here

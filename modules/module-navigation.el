;; Navigation related settings and binds.

(require 'core-functions)

(use-package windmove
  :bind
  ("C-x <up>" . windmove-up)
  ("C-x <down>" . windmove-down)
  ("C-x <left>" . windmove-left)
  ("C-x <right>" . windmove-right)
  ("C-x h". windmove-left)
  ("C-x j". windmove-down)
  ("C-x k". windmove-up)
  ("C-x l". windmove-right)
  )

;; neotree
(use-package neotree
  :ensure t
  :requires (evil-leader)
  :after projectile
  :init
  (setq neo-smart-open t)
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (evil-leader/set-key "n"  'neotree-toggle)
  (setq projectile-switch-project-action 'neotree-projectile-action)
  :config
  (evil-define-key 'normal neotree-mode-map (kbd "+") 'neotree-create-node)
  (evil-define-key 'normal neotree-mode-map (kbd "R") 'neotree-rename-node)
  (evil-define-key 'normal neotree-mode-map (kbd "D") 'neotree-delete-node)
  (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
  (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
  (evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-next-line)
  (evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-previous-line)
  (evil-define-key 'normal neotree-mode-map (kbd "U") 'neotree-select-up-node)
  (evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
  (evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle))

;; saveplace
;; Remebers your location in a file when saving files.
(use-package saveplace
  :init
  (setq save-place-file (core-cache-for "saveplace"))
  (setq-default save-place t))

;; avy
;; A better jump to char and line.
(use-package avy
  :config (setq avy-style 'at)
  :bind (("C-o" . avy-goto-char)
          ("M-g" . avy-goto-line)))

;; recentf
;; Open/view recent files.
(use-package recentf
  :commands recentf-mode
  :config
  (setq recentf-auto-cleanup 'never
    recentf-max-saved-items 200
    recentf-auto-cleanup 300
    recentf-exclude '("/TAGS$"
                       "/tmp/"
                       "/var/tmp/"
                       ".recentf"
                       "ido.last"
                       "/elpa/.*\\'"))
  (setq recentf-save-file (core-cache-for "recentf"))
  (recentf-mode))

(provide 'module-navigation)
;;; module-navigation.el ends here

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

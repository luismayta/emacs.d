;;; module-ui.el --- UI niceties.

;; Bind for toggling fullscreen.
(bind-key "C-c M-f" 'toggle-frame-fullscreen)

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
        ido-enable-prefix nil
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
(use-package abbrev
  :ensure nil
  :diminish abbrev-mode)

;; get rid of the mouse.
(use-package avoid
  :if window-system
  :defer 10
  :config
  (mouse-avoidance-mode 'exile))

(provide 'module-ui)

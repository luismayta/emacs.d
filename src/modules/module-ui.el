;;; module-ui.el --- UI niceties.

;; uniquify
;; Overrides Emacs' default mechanism for making buffer names unique.
(use-package uniquify
  :ensure nil
  :config (setq uniquify-buffer-name-style 'forward))

(use-package flx-ido :requires ido :config (flx-ido-mode))
(use-package ido-vertical-mode :requires ido :config (ido-vertical-mode))
(use-package ido-hacks :requires ido :config (ido-hacks-mode))

(use-package ido
  :requires (evil-leader)
  :ensure flx-ido
  :init
  (ido-mode 1)
  (evil-leader/set-key "b" 'ido-switch-buffer)
  (evil-leader/set-key "k" 'ido-kill-buffer)
  :config
  (setq ido-auto-merge-delay-time 99999999)
  (setq ido-everywhere t)
  (setq ido-virtual-buffers t)
  (add-to-list 'ido-ignore-files "\\.DS_Store")
  (setq ido-enable-flex-matching t
    ido-ignore-buffers  '("\\` "  "^\*Back" ".*Completions\*" "^\*Ido" "^\*trace"
                           "^\*compilation" "^\*GTAGS" "^session\.*")
    ido-enable-prefix nil
    ido-use-url-at-point nil
    ido-use-faces nil
    )
  (ido-everywhere 1)
  (ido-vertical-mode 1)
  (flx-ido-mode 1))

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

(provide 'module-ui)
;;; module-ui.el ends here

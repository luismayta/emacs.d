;;; module-appearance.el --- Display and appearance related settings.

;;; code:

(require 'core-vars)
(require 'core-functions)
(require 'core-defaults)

;; eliminate scroll bars and do other things
(use-package better-defaults
  :ensure t
  )

(use-package graphene
  :ensure t
  :init
  (setq graphene-default-font core-default-font)
  (setq graphene-variable-pitch-font core-default-font)
  (setq graphene-fixed-pitch-font core-default-font)
  (setq ido-use-url-at-point nil)
  (linum-mode -1)
  )

(use-package all-the-icons
  :ensure t)

(use-package all-the-icons-dired
  :ensure t)


(use-package zerodark-theme
  :config
  (load-theme 'zerodark 1)
  ;; (zerodark-setup-modeline-format)
  (setq zerodark-use-paddings-in-mode-line nil)
  (set-cursor-color "violet")
  ;; stop cursor blinking and make sure it's a box
  (set-default 'cursor-type 'box)
  (blink-cursor-mode 0)
  )


;;==============mode-line===============

(use-package cyphejor
  :init
  (progn
    (setq
      cyphejor-rules
      '(:upcase
         ("bookmark"    "→")
         ("buffer"      "β")
         ("diff"        "Δ")
         ("dired"       "δ")
         ("emacs"       "ε")
         ("inferior"    "i" :prefix)
         ("interaction" "i" :prefix)
         ("interactive" "i" :prefix)
         ("lisp"        "λ" :postfix)
         ("menu"        "▤" :postfix)
         ("mode"        "")
         ("package"     "↓")
         ("python"      "π")
         ("shell"       "sh" :postfix)
         ("text"        "ξ")
         ("wdired"      "↯δ")))
    ))


(use-package nyan-mode
  :init
  (nyan-mode)
  (nyan-start-animation)
  )

(use-package rainbow-mode
  :commands rainbow-mode)


(use-package hlinum
  :config
  (hlinum-activate))

(use-package linum
  :config
  (setq linum-format " %4d ")
  (global-linum-mode nil)
  :init
  (add-hook 'prog-mode-hook #'linum-mode))

(use-package linum-relative
  :init
  (progn
    (defun my-linum-formatter (line-number)
      (propertize (format linum-relative-format line-number) 'face 'linum))
    (setq linum-format 'my-linum-formatter)
    ;; turn on linum-mode, and make it relative

    ;; emacs mode never shows linum
    (add-hook 'evil-emacs-state-entry-hook (lambda ()
                                             (linum-mode -1)))
    (add-hook 'evil-emacs-state-exit-hook (lambda ()
                                            (linum-mode 1)))

    ;; in normal mode, show relative numbering
    (add-hook 'evil-normal-state-entry-hook (lambda ()
                                              (setq linum-format 'linum-relative)))
    ;; turn off linum-mode, and make it normal again
    (add-hook 'evil-normal-state-exit-hook (lambda ()
                                             (setq linum-format 'my-linum-formatter)))

    ;; copy linum face so it doesn't look weird
    (custom-set-faces
      '(linum-relative-current-face
         ((t (:inherit linum :weight bold :reverse t))))))

  :config (setq linum-relative-current-symbol ">>"))

(use-package pretty-lambdada)

(use-package dired-hacks-utils
  :ensure t)

(def setup-windows-hook
  (run-with-idle-timer 0.1 nil (lambda nil (toggle-frame-maximized)))
  (when (eq system-type 'darwin)
    (setq mac-allow-anti-aliasing t)  ;; nice fonts in OS X
    (set-face-attribute 'default nil :height 135))
  (when (eq system-type 'gnu/linux)
    (set-face-attribute 'default nil :height 116))
  (setq-default truncate-lines 1)  ;; no word wrap
  )

(add-hook 'emacs-startup-hook #'setup-windows-hook)
; (evil-leader/set-key "fa" 'origami-toggle-all-nodes)

(provide 'module-appearance)
;;; module-appearance.el ends here

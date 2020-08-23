;;; module-appearance.el --- Display and appearance related settings.

;;; code:

(require 'core-vars)
(require 'core-functions)
(require 'core-defaults)

;; eliminate scroll bars and do other things
(use-package better-defaults
  :ensure t
  )

(use-package all-the-icons-dired
  :ensure t)

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(use-package doom-modeline
  :ensure t
  :defer t
  :init (doom-modeline-init)
  (setq doom-modeline-height 20 doom-modeline-bar-width 3 doom-modeline-icon nil
    doom-modeline-enable-word-count 10
    ;; doom-modeline-icon (display-graphic-p)
    doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode)
    doom-modeline-buffer-file-name-style 'relative-to-project doom-modeline-modal-icon nil)
  :hook (after-init . doom-modeline-mode)
  :config)

(use-package doom-themes
  ;; :when (display-graphic-p)
  :ensure t
  ;; :init (load-theme 'doom-Iosvkem t)
  :init (load-theme 'doom-one t)
  :config (set-face-attribute 'fringe nil
            :foreground "#fc5c59"
            :background (face-background 'default)))

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

(use-package dired-hacks-utils
  :ensure t)

(def setup-windows-hook
  (run-with-idle-timer 0.1 nil (lambda nil (toggle-frame-maximized)))
  (when (eq system-type 'darwin)
    (setq mac-allow-anti-aliasing t)  ;; nice fonts in OS X
    (set-face-attribute 'default nil :height core-font-height))
  (when (eq system-type 'gnu/linux)
    (set-face-attribute 'default nil :height 135))
  (setq-default truncate-lines 1)  ;; no word wrap
  )

(add-hook 'emacs-startup-hook #'setup-windows-hook)

;; treemacs
(use-package treemacs
  :requires (evil-leader evil)
  :ensure t
  :defer t
  :commands
  (treemacs)
  :init
  (evil-leader/set-key "ft" 'treemacs)
  )

(use-package treemacs-icons-dired
  :after treemacs dired
  :ensure t
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after treemacs magit
  :ensure t)

(use-package fira-code-mode
  ;; Requires installing Fira Code Symbol font first
  :custom (fira-code-mode-disabled-ligatures '("www" "[]" "#{" "#(" "#_" "#_(" "x"))
  :hook prog-mode)

(provide 'module-appearance)
;;; module-appearance.el ends here

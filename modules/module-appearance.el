;;; module-appearance.el --- Display and appearance related settings.

;;; code:

(require 'core-vars)
(require 'core-functions)
(require 'core-defaults)

(use-package all-the-icons-dired
  :quelpa (all-the-icons-dired :fetcher github
		   :repo "jtbm37/all-the-icons-dired")
  :ensure t)

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p)
  :config
  (setq
    all-the-icons-color-icons nil
    )
  )

(use-package doom-modeline
  :ensure t
  :defer t
  :init (doom-modeline-init)
  :config
  (setq
    doom-modeline-project-detection 'project
    doom-modeline-project-detection 'ffip
    doom-modeline-enable-word-count 10
    doom-modeline-icon (display-graphic-p)
    doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode)
    doom-modeline-buffer-file-name-style 'relative-to-project doom-modeline-modal-icon nil
    )
  :hook (after-init . doom-modeline-mode)
  )

(use-package doom-themes
  :ensure t
  :init (load-theme 'doom-one t)
  :config (set-face-attribute 'fringe nil
            :foreground "#fc5c59"
            :background (face-background 'default)))

(use-package linum
  :config
  (setq linum-format " %4d ")
  (global-linum-mode nil)
  :init
  :hook (prog-mode . linum-mode)
  )

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

  :config
  (setq
    linum-relative-current-symbol ">>"
    )
  )

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

(use-package fira-code-mode
  :quelpa (fira-code-mode :fetcher github
		   :repo "jming422/fira-code-mode")
  ;; Requires installing Fira Code Symbol font first
  :custom (fira-code-mode-disabled-ligatures '("www" "[]" "#{" "#(" "#_" "#_(" "x"))
  :hook prog-mode)

(provide 'module-appearance)
;;; module-appearance.el ends here

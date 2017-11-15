;;; module-appearance.el --- Display and appearance related settings.

;;; code:

(require 'core-vars)

;; Disable cursor display in inactive windows.
(setq-default cursor-in-non-selected-windows nil)

(add-hook 'emacs-startup-hook ;; 'window-setup-hook
  (lambda nil
    (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
    (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
    (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
    (run-with-idle-timer 0.1 nil (lambda nil (toggle-frame-maximized)))
    (set-face-attribute
      'default nil
      :family core/fixed-font-name
      :height core/font-height
      :weight core/fixed-font-weight)
    (set-face-attribute
      'linum nil
      :family core/fixed-font-name
      :height core/font-height
      :weight core/fixed-font-weight)
    (set-face-attribute
      'variable-pitch nil
      :family core/var-font-name))
  (use-package zerodark-theme
    :config (load-theme 'zerodark 1)))

(use-package nyan-mode
  :init
  (nyan-mode))

(use-package rainbow-mode
  :commands rainbow-mode)

(use-package origami
  :init
  (global-origami-mode 1))

(use-package hl-line
  :config
  ;; Doesn't seem to play nice in emacs 25+
  (setq hl-line-sticky-flag nil
    global-hl-line-sticky-flag nil)

  (defvar-local current-hl-line-mode nil)
  (defun hl-line-on ()  (if current-hl-line-mode (hl-line-mode +1)))
  (defun hl-line-off () (if current-hl-line-mode (hl-line-mode -1)))
  ;;(add-hook hl-line-mode (lambda () (if current-hl-line-mode (setq current-hl-line-mode t))))
  (global-hl-line-mode))

(use-package hlinum
  :config
  (hlinum-activate))

(use-package linum
  :config
  (setq linum-format " %4d ")
  (global-linum-mode nil)
  :init
  (add-hook 'prog-mode-hook #'linum-mode))

(provide 'module-appearance)
;;; module-appearance.el ends here

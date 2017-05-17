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
  (use-package darkokai-theme
    :config (load-theme 'noctilux 1)))

(use-package nyan-mode
  :init
  (nyan-mode))

(use-package rainbow-mode
  :commands rainbow-mode)

(use-package origami
  :init
  (global-origami-mode 1))

(provide 'module-appearance)
;;; module-appearance.el ends here

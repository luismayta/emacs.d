;;; lm-appearance.el --- Display and appearance related settings.

;; Disable cursor display in inactive windows.
(setq-default cursor-in-non-selected-windows nil)

;; Redraw without pause while processing input.
(setq redisplay-dont-pause t)

(defvar lm/fixed-font-name "SF Mono")
(defvar lm/fixed-font-weight 'light)
(defvar lm/var-font-name "SF UI Text")
(defvar lm/font-height 120)

(add-hook 'emacs-startup-hook ;; 'window-setup-hook
          (lambda nil
            (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
            (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
            (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
            (run-with-idle-timer 0.1 nil (lambda nil (toggle-frame-maximized)))
            (set-fringe-mode '(8 . 0))
            (set-face-attribute
             'default nil
             :family lm/fixed-font-name
             :height lm/font-height
             :weight lm/fixed-font-weight)
            (set-face-attribute
             'linum nil
             :family lm/fixed-font-name
             :height (- lm/font-height 20)
             :weight lm/fixed-font-weight)
            (set-face-attribute
             'variable-pitch nil
             :family lm/var-font-name))
          (use-package darkokai-theme
            :config (load-theme 'noctilux t)))

(use-package rainbow-mode
  :commands rainbow-mode)

(provide 'lm-appearance)

;; enable git shallow clone to save time and bandwidth

;; Install Packages
(bundle 'github-clone nil)

(bundle 'apache-mode nil)
(bundle 'puppet-mode nil)
(bundle 'dockerfile-mode nil)
(bundle 'erlang nil)
(bundle 'paredit nil)
(bundle 'slime nil)
(bundle 'fiplr nil)
(bundle 'emamux nil)
(bundle 'sml-mode nil)
(bundle 'smart-mode-line nil)
(bundle 'buffer-move nil)
(bundle 'fill-column-indicator nil)
(bundle 'flatland-theme nil)
(bundle 'lorem-ipsum nil)
(bundle 'lua-mode nil)
(bundle 'coffee-mode nil)
(bundle 'emmet-mode nil)
(bundle 'password-generator nil)

;; Config

(setq el-get-git-shallow-clone t)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)

(fset 'yes-or-no-p 'y-or-n-p)

(delete-selection-mode t)
(blink-cursor-mode t)
(show-paren-mode t)
(column-number-mode t)
(tooltip-mode -1)

;;Show the current function
(which-function-mode 1)
;; show the column number in the status bar
(column-number-mode t)

;; turn on ido mode everywhere
(ido-mode t)

;Show empty lines
(toggle-indicate-empty-lines)

;Highlight the current line
(global-hl-line-mode 1)

;; show matching braces
(show-paren-mode t)

;; the menu bar is pointless in a terminal
(menu-bar-mode -1)

;; don't show the tool bar when in a gui
(when (featurep 'tool-bar)
  (tool-bar-mode -1))

;; show whitespace...
(global-whitespace-mode t)

;; reload changes from disk
(global-auto-revert-mode t)

;; treat underscores as word chars
(modify-syntax-entry ?_ "w")

;; magic to change the mode-line color according to state
(lexical-let ((default-color (cons (face-background 'mode-line)
                                   (face-foreground 'mode-line))))
  (add-hook 'post-command-hook
    (lambda ()
      (let ((color (cond ((minibufferp) default-color)
                         ((evil-insert-state-p) '("#e80000" . "#ffffff"))
                         ((evil-emacs-state-p)  '("#af00d7" . "#ffffff"))
                         ((buffer-modified-p)   '("#006fa0" . "#ffffff"))
                         (t default-color))))
        (set-face-background 'mode-line (car color))
        (set-face-foreground 'mode-line (cdr color))))))

(set-frame-font "DejaVuSansMono:pixelsize=12")
(set-default-font "DejaVuSansMono 12")

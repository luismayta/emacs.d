;; enable git shallow clone to save time and bandwidth

;; Install Packages
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

;; turn on auto-completion of function names etc
(require 'auto-complete)
(global-auto-complete-mode t)

;; show whitespace...
(global-whitespace-mode t)

;; reload changes from disk
(global-auto-revert-mode t)

;; customize some global vars

(custom-set-variables
 '(ac-auto-start nil)
 '(ac-trigger-key "TAB")
 '(ansi-color-names-vector
   ["black" "red" "green" "yellow" "blue" "magenta" "cyan" "yellow"])
 '(auto-save-default nil)
 '(background-color nil)
 '(delete-selection-mode t)
 '(background-mode dark)
 '(column-number-mode t)
 '(cursor-color nil)
 '(custom-safe-themes
   (quote
    ("64581032564feda2b5f2cf389018b4b9906d98293d84d84142d90d7986032d33" "0c311fb22e6197daba9123f43da98f273d2bfaeeaeb653007ad1ee77f0003037" default)))
 '(evil-shift-width 4)
 '(evil-toggle-key (kbd "C-\\"))
 '(foreground-color nil)
 '(global-linum-mode t)
 '(ido-enable-flex-matching t)
 '(indent-tabs-mode nil)
 '(make-backup-files nil)
 '(require-final-newline t)
 '(ruby-deep-indent-paren nil)
 '(ruby-insert-encoding-magic-comment nil)
 '(scroll-conservatively 1000)
 '(scroll-step 1)
 '(tab-stop-list (number-sequence 2 200 2))
 '(tab-width 4)
 '(whitespace-style (quote (face trailing))))

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

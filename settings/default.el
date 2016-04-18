;--------------------------------;
;;; General or Global Settings ;;;
;--------------------------------;

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
(bundle 'lorem-ipsum nil)
(bundle 'lua-mode nil)
(bundle 'coffee-mode nil)
(bundle 'emmet-mode nil)
(bundle 'password-generator nil)
(bundle 'use-package nil)

; set PATH, because we don't load .bashrc
; function from https://gist.github.com/jakemcc/3887459
(defun set-exec-path-from-shell-PATH ()
  (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo -n $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(if window-system (set-exec-path-from-shell-PATH))

;; enable git shallow clone to save time and bandwidth
(setq el-get-git-shallow-clone t)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; change level warnings buffer
(setq inhibit-startup-message nil)
(setq display-warning-minimum-level 'error)

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

; language
(setq current-language-environment "English")

(prefer-coding-system 'utf-8)
; don't show the startup screen
(setq inhibit-startup-screen t)
; don't show the menu bar
(menu-bar-mode -1)
; don't show the tool bar
(require 'tool-bar)
(tool-bar-mode -1)
; don't show the scroll bar
(if window-system (scroll-bar-mode -1))

; turn on mouse wheel support for scrolling
(require 'mwheel)
(mouse-wheel-mode -1)

; set command key to be meta instead of option
(if (system-is-mac)
    (setq ns-command-modifier 'meta))

; number of characters until the fill column
(setq-default fill-column 80)

; each line of text gets one line on the screen (i.e., text will run
; off the left instead of wrapping around onto a new line)
(setq-default truncate-lines t)
; truncate lines even in partial-width windows
(setq truncate-partial-width-windows t)

; default window width and height
(defun custom-set-frame-size ()
  (add-to-list 'default-frame-alist '(height . 50))
  (add-to-list 'default-frame-alist '(width . 178)))
(custom-set-frame-size)
(add-hook 'before-make-frame-hook 'custom-set-frame-size)

; make end and home keys go to the start/end of buffers
(global-set-key (kbd "<end>") 'end-of-buffer)
(global-set-key (kbd "<home>") 'beginning-of-buffer)
(define-key input-decode-map "\e[1;5A" [C-up])
(define-key input-decode-map "\e[1;5B" [C-down])

; ignore case when searching
(setq-default case-fold-search t)

; show the current line and column numbers in the stats bar as well
(line-number-mode t)
(column-number-mode t)

; don't blink the cursor
(blink-cursor-mode -1)

; make sure transient mark mode is enabled (it should be by default,
; but just in case)
(transient-mark-mode t)

; highlight parentheses when the cursor is next to them
(require 'paren)
(show-paren-mode t)

; text decoration
(require 'font-lock)
;(setq font-lock-maximum-decoration t)
(global-font-lock-mode t)
(global-hi-lock-mode nil)
(setq jit-lock-contextually t)
(setq jit-lock-stealth-verbose t)

; if there is size information associated with text, change the text
; size to reflect it
(size-indication-mode t)

; disable backup
(setq backup-inhibited t)
; disable auto save
(setq auto-save-default nil)

(provide 'custom-settings)
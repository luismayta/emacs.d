;; emacs configuration

(setq debug-on-error t)

;; believe me, you don't need menubar, toolbar nor scrollbar
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))
;; enable git shallow clone to save time and bandwidth
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

(set-frame-font "Menlo-16")

;; Specify a dependency (auto-install)
(defun dep (depname)
  "Require or install a dependency as needed."
  (interactive)
  (unless (package-installed-p depname)
    (install-dep depname nil)))

;; Specify a dependency (auto-install)
(defun dep_el-get (depname)
  "Require or install a dependency as needed."
  (interactive)
  (unless (package-installed-p depname)
    (install-el-get depname nil)))

;; Convenience around `package-install'.
(defun install-dep (depname refresh)
  "Runs `package-install', attempting `package-refresh-contents' on failure."
  (when refresh (package-refresh-contents))
  (condition-case err
      (package-install depname)
    (error (if refresh
               (signal (car err) (cdr err))
             (install-dep depname t)))))

;; Convenience around `package-install'.
(defun install-el-get (depname refresh)
  "Runs `el-get-install', attempting `package-refresh-contents' on failure."
  (when refresh (package-refresh-contents))
  (condition-case err
      (el-get-install depname)
    (error (if refresh
               (signal (car err) (cdr err))
             (install-el-get depname t)))))
;; Specify a list of dependencies
(defun dependencies (deps)
  "Convenience around `dep' to load multiple deps."
  (unless (eq '() deps)
    (dep (car deps))
    (dependencies (cdr deps))))

;; Specify a list of dependencies
(defun dependencies_el-get (deps)
  "Convenience around `dep' to load multiple deps."
  (unless (eq '() deps)
    (dep (car deps))
    (dependencies (cdr deps))))

(defun ruby-mode-hook ()
  (autoload 'ruby-mode "ruby-mode" nil t)
  (add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
  (add-hook 'ruby-mode-hook '(lambda ()
                               (setq ruby-deep-arglist t)
                               (setq ruby-deep-indent-paren nil)
                               (setq c-tab-always-indent nil)
                               (require 'inf-ruby)
                               (require 'ruby-compilation)
                               (define-key ruby-mode-map (kbd "M-r") 'run-rails-test-or-ruby-buffer))))
(defun rhtml-mode-hook ()
  (autoload 'rhtml-mode "rhtml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
  (add-to-list 'auto-mode-alist '("\\.rjs\\'" . rhtml-mode))
  (add-hook 'rhtml-mode '(lambda ()
                           (define-key rhtml-mode-map (kbd "M-s") 'save-buffer))))

(defun yaml-mode-hook ()
  (autoload 'yaml-mode "yaml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode)))

(defun css-mode-hook ()
  (autoload 'css-mode "css-mode" nil t)
  (add-hook 'css-mode-hook '(lambda ()
                              (setq css-indent-level 2)
                              (setq css-indent-offset 2))))
(defun is-rails-project ()
  (when (textmate-project-root)
    (file-exists-p (expand-file-name "config/environment.rb" (textmate-project-root)))))

(defun run-rails-test-or-ruby-buffer ()
  (interactive)
  (if (is-rails-project)
      (let* ((path (buffer-file-name))
             (filename (file-name-nondirectory path))
             (test-path (expand-file-name "test" (textmate-project-root)))
             (command (list ruby-compilation-executable "-I" test-path path)))
        (pop-to-buffer (ruby-compilation-do filename command)))
    (ruby-compilation-this-buffer)))

(require 'package)
;; elpy archives

(add-to-list 'package-archives
    '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(add-to-list 'package-archives
    '("marmalade" . "http://marmalade-repo.org/packages/"))

(setq package-archives (cons '("tromey" . "http://tromey.com/elpa/") package-archives))

(unless (require 'el-get nil 'noerror)
  (require 'package)
  (add-to-list 'package-archives
      '("melpa" . "http://melpa.org/packages/"))
  ;; melpa (github-based) source
  ;(add-to-list 'package-archives
      ;'("melpa" . "http://melpa.milkbox.net/packages/"))
  (package-refresh-contents)
  (package-initialize)
  (package-install 'el-get)
  (require 'el-get))

;; common lispy things
(require 'cl)

(package-initialize)

;(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
;(require 'el-get)

(setq el-get-sources
      '((:name ruby-mode
               :type elpa
               :load "ruby-mode.el"
               :after (lambda () (ruby-mode-hook)))
        (:name inf-ruby  :type elpa)
        (:name ruby-compilation :type elpa)
        (:name css-mode
               :type elpa
               :after (lambda () (css-mode-hook)))
        (:name noctilux-theme
               :type git
               :url "https://github.com:stafu/noctilux-theme.git"
               :load "noctilux-theme.el")
        (:name textmate
               :type git
               :url "git://github.com/defunkt/textmate.el"
               :load "textmate.el")
        (:name rvm
               :type git
               :url "http://github.com/djwhitt/rvm.el.git"
               :load "rvm.el"
               :compile ("rvm.el")
               :after (lambda() (rvm-use-default)))
        (:name rhtml
               :type git
               :url "https://github.com/crazycode/rhtml.git"
               :features rhtml-mode
               :after (lambda () (rhtml-mode-hook)))
        (:name yaml-mode
               :type git
               :url "http://github.com/yoshiki/yaml-mode.git"
               :features yaml-mode
               :after (lambda () (yaml-mode-hook)))
	))

(el-get 'sync)

;;; -- Dependencies

(dependencies '(subatomic256-theme
                noctilux-theme
                evil
                evil-leader
                evil-numbers
                paredit
                puppet-mode
                apache-mode
                erlang
                auto-complete
                markdown-mode
                yaml-mode
                web-mode
                slime
                fiplr
                python-mode
                php-mode))

(dependencies_el-get '(jedi))
;; Do what I mean for the TAB key.
(defun dwim-tab ()
  "In most cases, performs the default action for the TAB key.
If pressing TAB would do nothing, indents by one tab stop."
  (interactive)
  (when (or (eq last-command this-command)
            (= (point) (progn
                         (indent-for-tab-command)
                         (point))))
    (tab-to-tab-stop)))

;; dwim-tab-mode for logical tab key behaviour
(define-minor-mode dwim-tab-mode
  "Toggle dwim-tab-mode on/off.
Given a non-nil argument, enables dwim-tab.
With dwim-tab-mode enabled, pressing TAB multiple times continues to indent."
  :lighter " DWIM"
  :global  t
  :keymap  `((,(kbd "TAB") . dwim-tab)))

;; no fucking latin-1, thank you very much
(mapc (lambda (fn) (funcall fn 'utf-8))
      '(set-terminal-coding-system
        set-keyboard-coding-system
        prefer-coding-system))

;;; -- Config
(set-frame-font "Menlo-16")
;; make pretty colors
(add-to-list 'custom-theme-load-path "~/.emacs.d/lib/color-themes")
(load-theme 'noctilux t)

;; emacs is actually vim in disguise
(evil-mode t)

;; show the column number in the status bar
(column-number-mode t)

;; turn on ido mode everywhere
(ido-mode t)

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

;; Don't move back the cursor one position when exiting insert mode' 
(setq evil-move-cursor-back nil)

;; evil leader
(global-evil-leader-mode t)

;;set evil leader
(evil-leader/set-leader ",")

;; mapping keys evil leader
(evil-leader/set-key
  "e" 'find-file
  "n" 'neotree-toggle
  "f" 'fiplr-find-file
  "b" 'switch-to-buffer
  "k" 'kill-buffer)

;; show whitespace...
(global-whitespace-mode t)

;; reload changes from disk
(global-auto-revert-mode t)

;; global key mappings
;(mapc (lambda (mapping)
        ;(global-set-key (kbd (car mapping)) (cdr mapping)))
      ;`(;; toggle line numbers
        ;("C-x j"   . ,(run ('linum-mode (or (not 'linum-mode) 0))))
        ;;; open ~/.emacs.d/init.el
        ;("C-x /"   . ,(run (find-file user-init-file)))
        ;;; run an emacs command
        ;("C-x SPC" . execute-extended-command)
        ;;; run a lisp expression
        ;("C-x ,"   . eval-expression)
        ;;; find file in project
        ;("C-x f"   . fiplr-find-file)))

;; evil normal mode key mappings
(mapc (lambda (mapping)
        (define-key evil-normal-state-map (kbd (car mapping)) (cdr mapping)))
      `(;; increment number under point
        ("C-k"   . evil-numbers/inc-at-pt)
        ;; decrement number under point
        ("C-j"   . evil-numbers/dec-at-pt)))

;; allow the arrow keys to be used for cycling windows
(mapc (lambda (keys)
        (let ((letter (format "C-w %s" (car keys)))
              (arrow  (format "C-w %s" (cdr keys))))
          (define-key evil-normal-state-map (kbd arrow) (kbd letter))
          (define-key evil-motion-state-map (kbd arrow) (kbd letter))
          (define-key evil-visual-state-map (kbd arrow) (kbd letter))))
      '(("h" . "<left>")
        ("j" . "<down>")
        ("k" . "<up>")
        ("l" . "<right>")))

;; customize some global vars
(fset 'yes-or-no-p 'y-or-n-p)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
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

;; .md files should use markdown-mode
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; templates web mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jade\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . web-mode))

;; make php-mode indentation vaguely sane
(add-hook 'php-mode-hook
  (lambda ()
    (setq indent-tabs-mode t)
    (setq tab-width 4)
    (setq evil-shift-width 4)
    (set (make-local-variable 'tab-stop-list) (number-sequence 4 200 4))
    (c-set-offset 'substatement-open 0)))

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

;;; -- User config
(let ((custom-config "~/.emacs.d/custom.el"))
  (when (file-exists-p custom-config)
    (load custom-config)))

;;; .emacs ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

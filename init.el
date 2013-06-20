;;; .emacs -- d11wtq's configuration file

;;; --- Bootstrap

;; elpa package management
(require 'package)

;; common lispy things
(require 'cl)

;; melpa (github-based) source
(add-to-list 'package-archives
  '("melpa" .
      "http://melpa.milkbox.net/packages/"))

;; marmalade source
(add-to-list 'package-archives
  '("marmalade" .
      "http://marmalade-repo.org/packages/"))

;; start the package system
(package-initialize)

;; Specify a dependency (auto-install)
(defun dep (depname)
  "Require or install a dependency as needed."
  (interactive)
  (unless (require depname nil t)
    (install-dep depname nil)))

;; Convenience around `package-install'.
(defun install-dep (depname refresh)
  "Runs `package-install', attempting `package-refresh-contents' on failure."
  (when refresh (package-refresh-contents))
  (condition-case err
      (package-install depname)
    (error (if refresh
               (signal (car err) (cdr err))
             (install-dep depname t)))))

;; Specify a list of dependencies
(defun dependencies (deps)
  "Convenience around `dep' to load multiple deps."
  (unless (eq '() deps)
    (dep (car deps))
    (dependencies (cdr deps))))

;; Macro to return an interactive lambda.
(defmacro run (cmd)
  `(lambda () (interactive) ,cmd))

;;; -- Dependencies

(dependencies '(subatomic256-theme
                evil
                paredit
                erlang
                auto-complete
                markdown-mode
                slime
                fiplr
                php-mode))

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

;; make pretty colors
(load-theme 'subatomic256 t)

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
(tool-bar-mode -1)

;; use reasonably sane tab settings
(dwim-tab-mode t)

;; turn on auto-completion of function names etc
(global-auto-complete-mode t)

;; move to the previous window
(global-set-key (kbd "C-x p") (run (other-window -1)))

;; toggle line numbers on/off
(global-set-key (kbd "C-x j") (run (linum-mode (or (not linum-mode) -1))))

;; alternative to M-x for running an Emacs command
(global-set-key (kbd "C-x x") 'execute-extended-command)

;; fuzzy find file in project
(global-set-key (kbd "C-x f") 'fiplr-find-file)

;; clear the directory cache from fiplr
(global-set-key (kbd "C-x c") 'fiplr-clear-cache)

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

;; show whitespace...
(global-whitespace-mode t)

;; reload changes from disk
(global-auto-revert-mode t)

;; customize some global vars
(custom-set-variables
 ;; by default evil binds C-z
 '(evil-toggle-key (kbd "C-\\"))
 ;; fuck #autosave# files
 '(auto-save-default nil)
 ;; fuck backup~ files
 '(make-backup-files nil)
 ;; put newlines at the end of files
 '(require-final-newline t)
 ;; don't scroll by huge amounts near the edge of window
 '(scroll-step 1)
 ;; don't do anything if the point leaves the screen (it won't)
 '(scroll-conservatively 1000)
 ;; fuzzy searching in ido
 '(ido-enable-flex-matching t)
 ;; soft tabs in most places
 '(indent-tabs-mode nil)
 ;; 4 spaces is a nice true tab size
 '(tab-width 4)
 ;; 2 spaces is a nice indent amount
 '(tab-stop-list (number-sequence 2 200 2))
 ;; auto-complete on tab key
 '(ac-trigger-key "TAB")
 ;; only auto-complete when asked
 '(ac-auto-start nil)
 ;; only show trailing whitespace
 '(whitespace-style '(face trailing))
 ;; ruby-mode wants to add # -* coding: utf-8 -* everywhere: fuck off
 '(ruby-insert-encoding-magic-comment nil)
 ;; ruby-mode's default indentation is hideous
 '(ruby-deep-indent-paren nil))

;; .md files should use markdown-mode
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; php templates should just use html-mode
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . html-mode))

;; make php-mode indentation vaguely sane
(add-hook 'php-mode-hook
  (lambda ()
    (setq indent-tabs-mode t)
    (setq tab-width 4)
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

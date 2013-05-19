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

;; start the elpa system
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

(dependencies '(molokai-theme
                evil
                erlang
                auto-complete
                markdown-mode
                fiplr
                php-mode))

;; no fucking latin-1, thank you
(mapcar (lambda (fn) (apply fn '(utf-8)))
        '(set-terminal-coding-system
          set-keyboard-coding-system
          prefer-coding-system))

;;; -- Config

;; make pretty colors
(load-theme 'molokai t)

;; emacs is actually vim in disguise
(evil-mode t)

;; show the column number in the status bar
(column-number-mode t)

;; turn on ido mode everywhere
(ido-mode t)

;; show matching braces
(show-paren-mode t)

;; turn on auto-completion of function names etc
(global-auto-complete-mode t)

;; move to the previous window
(global-set-key (kbd "C-x p") (run (other-window -1)))

;; toggle line numbers on/off
(global-set-key (kbd "C-x j") (run (linum-mode (or (not linum-mode) -1))))

;; fuzzy find file in project
(global-set-key (kbd "C-x f") 'fiplr-find-file)

;; clear the directory cache from fiplr
(global-set-key (kbd "C-x c") 'fiplr-clear-cache)

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
    (c-set-offset 'substatement-open 0)))

;;; -- User config

(let ((custom-config "~/.emacs.d/custom.el"))
  (when (file-exists-p custom-config)
    (load custom-config)))

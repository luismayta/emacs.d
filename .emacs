;; Emacs User Configuration File

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
  (interactive)
  (unless (require depname nil t)
    (package-install depname)))

;; Specify a list of dependencies
(defun dependencies (deps)
  (unless (eq '() deps)
    (dep (car deps))
    (dependencies (cdr deps))))

;; bootstrap elpa repos
(unless (file-exists-p "~/.emacs.d/elpa/archives")
  (package-refresh-contents))

;; -- Dependencies

(dependencies '(color-theme
                molokai-theme
                evil
                erlang
                auto-complete
                markdown-mode
                php-mode))

;; emacs is actually vim in disguise
(evil-mode t)

;; by default evil binds C-z, which is silly
(evil-set-toggle-key (kbd "C-\\"))

;; show the column number in the status bar
(column-number-mode t)

;; turn on ido mode everywhere
(ido-mode t)

;; fuck #auto-save# files
(setq auto-save-default nil)

;; fuck backup~ files
(setq make-backup-files nil)

;; bind ctrl-p to the file finder
(global-set-key (kbd "C-p") 'find-file-in-project)

;; find-file-in-project should use entire paths
(setq ffip-full-paths t)

;; use soft tabs by default
(setq-default indent-tabs-mode nil)

;; 2 spaces for soft tab stops
(setq tab-stop-list (number-sequence 2 200 2))

;; 4 spaces for actual tab sizing
(setq-default tab-width 4)

;; show matching braces
(show-paren-mode t)

;; .md files should use markdown-mode
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; turn on auto-completion of function names etc
(global-auto-complete-mode t)

;; require pressing TAB to auto-complete
(setq ac-trigger-key "TAB")

;; don't show the auto-complete menu unless asked
(setq ac-auto-start nil)

;; move to the previous window with C-x p
(global-set-key (kbd "C-x p") (lambda () (interactive) (other-window -1)))

;; show whitespace...
(global-whitespace-mode t)

;; but limit visual whitespace to trailing spaces
(setq-default whitespace-style '(face trailing))

;; ruby-mode's default indentation is hideous
(setq ruby-deep-indent-paren nil)

;; ruby-mode wants to add # -* coding: utf-8 -* everywhere: fuck off
(setq ruby-insert-encoding-magic-comment nil)

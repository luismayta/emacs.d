;;; init.el --- Start of the Emacs initialisation process.

;; Increase the GC threshold as soon as possible.
(setq gc-cons-threshold 50000000)

;; emacs configuration
(require 'package)
(require 'cl)

;; Prepare paths.
(add-to-list 'load-path (expand-file-name "settings/" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "core/" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "modules/" user-emacs-directory))
(add-to-list 'custom-theme-load-path (expand-file-name "lib/color-themes" user-emacs-directory))
(add-to-list 'exec-path "/usr/local/bin")

;; define various custom functions
(require 'custom-functions)

(require 'exec-path-from-shell)

;; Load PATH from environment
(exec-path-from-shell-initialize)

;; Repositories
;; The ELPA repositories from where the packages are fetched.

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                          ("melpa" . "http://melpa.org/packages/")
                          ("org" . "http://orgmode.org/elpa/")
                          ("marmalade" . "http://marmalade-repo.org/packages/")))

(add-to-list 'load-path (expand-file-name "el-get/el-get/" user-emacs-directory))

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
    (url-retrieve-synchronously
      "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path (expand-file-name "emacs.d/el-get-user/recipes" user-emacs-directory))
(el-get 'sync)

;;; initialize the packages and create the packages list if not exists
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

;; define various custom hooks
(require 'custom-hook)

;; enable git shallow clone to save time and bandwidth
(setq el-get-git-shallow-clone t)

(setq debug-on-error nil)

;; no fucking latin-1, thank you very much
(mapc (lambda (fn) (funcall fn 'utf-8))
      '(set-terminal-coding-system
        set-keyboard-coding-system
        prefer-coding-system))

;;; .emacs ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-auto-start nil)
 '(ac-trigger-key "TAB")
 '(auto-save-default nil)
 '(column-number-mode t)
 '(delete-selection-mode t)
 '(evil-shift-width 4)
 '(evil-toggle-key (kbd "C-\\"))
 '(global-linum-mode t)
 '(helm-gtags-auto-update t)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-path-style (quote relative))
 '(ido-enable-flex-matching t)
 '(make-backup-files nil)
 '(require-final-newline t)
 '(ruby-deep-indent-paren nil)
 '(ruby-insert-encoding-magic-comment nil)
 '(scroll-conservatively 1000)
 '(scroll-step 1))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'mywhitespace)

;; configure general settings
(require 'default-settings)
(require 'clipboard-settings)
(require 'confmode-settings)
(require 'environments-settings)
(require 'editorconfig-settings)
(require 'helm-settings)
(require 'helm-gtags-settings)
(require 'fixmee-settings)
(require 'projectile-settings)
(require 'theme-settings)
(require 'terraform-settings)
(require 'feature-settings)
(require 'google-translate-settings)
(require 'skeletor-settings)
(require 'autocomplete-settings)
(require 'emamux-settings)
;; (require 'yasnippet-settings)
(require 'git-settings)
(require 'gist-settings)
(require 'go-settings)
(require 'ruby-settings)
(require 'php-settings)
(require 'webmode-settings)
(require 'css-settings)
(require 'yaml-settings)
(require 'markdown-settings)
(require 'python-settings)
(require 'nginx-settings)
(require 'sml-modeline-settings)
(require 'git-gutter-plus-settings)
(require 'wakatime-settings)
(require 'evil-settings)

(setq my-settings
  '(
     "~/.emacs.d/custom.el"
     ))

(dolist (setting my-settings)
  (when (file-exists-p setting)
    (load setting)))

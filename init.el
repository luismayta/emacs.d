;; emacs configuration
(require 'package)

(require 'cl)

;; Repositories
;; The ELPA repositories from where the packages are fetched.

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                          ("melpa" . "http://melpa.org/packages/")
                          ("org" . "http://orgmode.org/elpa/")
                          ("marmalade" . "http://marmalade-repo.org/packages/")))

;; Convenience around `package-install'.
(defun bundle (depname refresh)
  "Runs `package-install', attempting `package-refresh-contents' on failure."
  (when refresh (package-refresh-contents))
  (package-install depname))

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
    (url-retrieve-synchronously
      "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

;;; initialize the packages and create the packages list if not exists
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

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
 '(ansi-color-names-vector
   ["black" "red" "green" "yellow" "blue" "magenta" "cyan" "yellow"])
 '(auto-save-default nil)
 '(background-color nil)
 '(background-mode dark)
 '(column-number-mode t)
 '(cursor-color nil)
 '(custom-safe-themes
   (quote
    ("f11b028f78c8934c4dea255d94c491f7ced8720db594f9454dbec55938af3934" "1c57936ffb459ad3de4f2abbc39ef29bfb109eade28405fa72734df1bc252c13" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "64581032564feda2b5f2cf389018b4b9906d98293d84d84142d90d7986032d33" "0c311fb22e6197daba9123f43da98f273d2bfaeeaeb653007ad1ee77f0003037" default)))
 '(delete-selection-mode t)
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
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq my-config
  '(
     "~/.emacs.d/conf/default.el"
     "~/.emacs.d/conf/editorconfig.el"
     "~/.emacs.d/conf/evil.el"
     "~/.emacs.d/conf/projectile.el"
     "~/.emacs.d/conf/fixmee.el"
     "~/.emacs.d/conf/theme.el"
     "~/.emacs.d/conf/feature.el"
     "~/.emacs.d/conf/helm-gtags.el"
     "~/.emacs.d/conf/google-translate.el"
     "~/.emacs.d/conf/skeletor.el"
     "~/.emacs.d/conf/aggressive-indent.el"
     "~/.emacs.d/conf/autocomplete.el"
     "~/.emacs.d/conf/emamux.el"
     "~/.emacs.d/conf/yasnippet.el"
     "~/.emacs.d/conf/git.el"
     "~/.emacs.d/conf/gist.el"
     "~/.emacs.d/conf/go.el"
     "~/.emacs.d/conf/php.el"
     "~/.emacs.d/conf/ruby.el"
     "~/.emacs.d/conf/web-mode.el"
     "~/.emacs.d/conf/css.el"
     "~/.emacs.d/conf/yaml.el"
     "~/.emacs.d/conf/markdown.el"
     "~/.emacs.d/conf/python.el"
     "~/.emacs.d/custom.el"
     ))

(dolist (config my-config)
  (when (file-exists-p config)
    (load config)))

(setq my-files
      '(
        "~/.emacs.d/functions.el"
        "~/.emacs.d/hooks.el"
        ))

(dolist (file my-files)
  (when (file-exists-p file)
    (load file)))

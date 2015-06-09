;; emacs configuration

(require 'package)

(require 'cl)

;; Repositories

;; The ELPA repositories from where the packages are fetched.

;; elpy archives
(add-to-list 'package-archives
    '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                        ("marmalade" . "http://marmalade-repo.org/packages/")))

;;;el get install
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/"))
  (package-refresh-contents)
  (package-initialize)
  (package-install 'el-get)
  (require 'el-get))

;; Auto-installation

;; The auto-installation process for all the packages that are not
;; already installed. This is for bootstrap a fresh install.

;;; initialize the packages and create the packages list if not exists
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

;; enable git shallow clone to save time and bandwidth
(setq el-get-git-shallow-clone t)

(el-get 'sync)

(package-initialize)

(setq debug-on-error t)

;; Convenience around `package-install'.
(defun bundle (depname refresh)
  "Runs `package-install', attempting `package-refresh-contents' on failure."
  (when refresh (package-refresh-contents))
  (condition-case err
      (package-install depname)
    (error (if refresh
               (signal (car err) (cdr err))
             (bundle depname t)))))

;; no fucking latin-1, thank you very much
(mapc (lambda (fn) (funcall fn 'utf-8))
      '(set-terminal-coding-system
        set-keyboard-coding-system
        prefer-coding-system))

(setq my-config
      '(
        "~/.emacs.d/conf/custom.el"
        "~/.emacs.d/conf/editorconfig.el"
        "~/.emacs.d/conf/theme.el"
        "~/.emacs.d/conf/autocomplete.el"
        "~/.emacs.d/conf/emamux.el"
        "~/.emacs.d/conf/yasnippet.el"
        "~/.emacs.d/conf/evil.el"
        "~/.emacs.d/conf/git.el"
        "~/.emacs.d/conf/go.el"
        "~/.emacs.d/conf/python.el"
        "~/.emacs.d/conf/php.el"
        "~/.emacs.d/conf/ruby.el"
        "~/.emacs.d/conf/web-mode.el"
        "~/.emacs.d/conf/css.el"
        "~/.emacs.d/conf/yaml.el"
        "~/.emacs.d/conf/markdown.el"
        ))

(dolist (config my-config)
  (when (file-exists-p config)
    (load config)))

;;; .emacs ends here

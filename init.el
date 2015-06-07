;; emacs configuration

(require 'package)

(require 'cl)

;; Packages list
;; The list of packages to install in a fresh installation. The way to
;; maintain clean and updated this list for me is the following:
;; - Install a package from the =package.el= built-in interface via =M-x list-packages=
;; - Test it
;;   - If seems Ok and I want to use it regularly, add it to the list.
;;   - If I don't like it, delete the plugin directory in the =~/.emacs.d/elpa= tree.
;;     I don't care too much about other dependecies that could be also
;;     installed, I'll get rid of them in the next clean install.

; A package for line helps to mantain the list

(setq my-packages
      '(
        evil
        evil-leader
        evil-numbers
        evil-nerd-commenter
        paredit
        puppet-mode
        apache-mode
        dockerfile-mode
        erlang
        markdown-mode
        yaml-mode
        web-mode
        slime
        fiplr
        python-mode
        emamux
        yasnippet
        yasnippet-bundle
        smart-mode-line
        sml-mode
        magit
        git-commit-mode
        git-rebase-mode
        gitconfig-mode
        gitignore-mode
        php-mode
        auto-complete
        buffer-move
        fill-column-indicator
        flatland-theme
        lua-mode
        lorem-ipsum
        editorconfig
        coffee-mode
        ))

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

;;; install packages if not exists
(dolist (pkg my-packages)
  (when (and (not (package-installed-p pkg)))
        (package-install pkg)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

;; enable git shallow clone to save time and bandwidth
(setq el-get-git-shallow-clone t)

(el-get 'sync)

(package-initialize)

(setq debug-on-error t)

;; believe me, you don't need menubar, toolbar nor scrollbar
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

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
(defun bundle (depname refresh)
  "Runs `package-install', attempting `package-refresh-contents' on failure."
  (when refresh (package-refresh-contents))
  (condition-case err
      (package-install depname)
    (error (if refresh
               (signal (car err) (cdr err))
             (bundle depname t)))))

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

(defun yaml-mode-hook ()
  (autoload 'yaml-mode "yaml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode)))

(defun css-mode-hook ()
  (autoload 'css-mode "css-mode" nil t)
  (add-hook 'css-mode-hook '(lambda ()
                              (setq css-indent-level 2)
                              (setq css-indent-offset 2))))

;(setq el-get-sources
      ;'((:name ruby-mode
               ;:type elpa
               ;:load "ruby-mode.el"
               ;:after (lambda () (ruby-mode-hook)))
        ;(:name inf-ruby  :type elpa)
        ;(:name ruby-compilation :type elpa)
        ;(:name css-mode
               ;:type elpa
               ;:after (lambda () (css-mode-hook)))
        ;(:name noctilux-theme
               ;:type git
               ;:url "https://github.com:stafu/noctilux-theme.git"
               ;:load "noctilux-theme.el")
        ;(:name textmate
               ;:type git
               ;:url "git://github.com/defunkt/textmate.el"
               ;:load "textmate.el")
        ;(:name rvm
               ;:type git
               ;:url "http://github.com/djwhitt/rvm.el.git"
               ;:load "rvm.el"
               ;:compile ("rvm.el")
               ;:after (lambda() (rvm-use-default)))
        ;(:name rhtml
               ;:type git
               ;:url "https://github.com/crazycode/rhtml.git"
               ;:features rhtml-mode
               ;:after (lambda () (rhtml-mode-hook)))
        ;(:name yaml-mode
               ;:type git
               ;:url "http://github.com/yoshiki/yaml-mode.git"
               ;:features yaml-mode
               ;:after (lambda () (yaml-mode-hook)))
	;))

;(el-get 'sync)

;;; -- Dependencies

(dependencies_el-get '(jedi
			))
;tab yasnippet
(setq yas-trigger-key "TAB")
;; no fucking latin-1, thank you very much
(mapc (lambda (fn) (funcall fn 'utf-8))
      '(set-terminal-coding-system
        set-keyboard-coding-system
        prefer-coding-system))

(setq my-config
      '(
        "~/.emacs.d/conf/custom.el"
        "~/.emacs.d/conf/evil.el"
        "~/.emacs.d/conf/go.el"
        "~/.emacs.d/conf/python.el"
        "~/.emacs.d/conf/php.el"
        "~/.emacs.d/conf/ruby.el"
        "~/.emacs.d/conf/web-mode.el"
        "~/.emacs.d/conf/markdown.el"
        ))

(dolist (config my-config)
  (when (file-exists-p config)
    (load config)))

;;; .emacs ends here

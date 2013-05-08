;;; Emacs User Configuration File

;; elpa package management
(require 'package)

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
  (unless (require depname nil t)
    (package-install depname)))

;; -- Dependencies

;; color-theme support
(dep 'color-theme)

;; molokai color theme
(dep 'molokai-theme)

;; erlang major mode
(dep 'erlang)

;; ido mode stuff (auto-complete)
(dep 'ido-ubiquitous)

;; turn on ido mode everywhere
(ido-mode)

;;; init.el --- Start of the Emacs initialisation process.

;;; code:

;; Increase the GC threshold as soon as possible.
(setq gc-cons-threshold 50000000)

;; Packages need to be initialised in init.el in Emacs 25.x.
(unless (fboundp 'package-initialize)
  (require 'package))
(package-initialize)

;; Prepare paths.
(add-to-list 'load-path (expand-file-name "core/" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "modules/" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lib/elisp" user-emacs-directory))
(add-to-list 'custom-theme-load-path (expand-file-name "lib/color-themes" user-emacs-directory))
(add-to-list 'exec-path "/usr/local/bin")

;; Set up aliases.
(require 'core-aliases)

;; Set up some defaults settings
(require 'core-defaults)

;; Custom functions
(require 'core-defuns)

;; Set up available modules and the load-modules function
(require 'core-modules)

;; Load configured modules.
(core-modules/load-modules)
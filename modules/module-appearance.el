;;; module-appearance.el --- Display and appearance related settings.

;;; code:

(require 'core-vars)
(require 'core-defuns)

(use-package no-littering)
(use-package use-package-chords)
(use-package use-package-ensure-system-package)
(use-package add-hooks)

(use-package graphene
  :config
  (setq graphene-default-font "Fira Code Retina-16")
  (setq graphene-variable-pitch-font "Fira Code Retina-16")
  (setq graphene-fixed-pitch-font "Fira Code Retina-16")
  )

(use-package pretty-mode
  :ensure t
  :config
  (global-pretty-mode t)
  (global-prettify-symbols-mode t)
  (pretty-deactivate-groups
    '(:logic :sets))
  (pretty-activate-groups
    '(:equality :ordering :ordering-double :ordering-triple
       :arrows :arrows-twoheaded :punctuation
       :sub-and-superscripts :greek :arithmetic-nary)))

(use-package nyan-mode
  :init
  (nyan-mode))

(def lm-install-fira-code-font
  (let* ((font-name "FiraCode-Retina.ttf")
          (font-url
            (format "https://github.com/tonsky/FiraCode/blob/master/distr/ttf/%s?raw=true" font-name))
          (font-dest
            (cl-case window-system
              (x  (concat (or (getenv "XDG_DATA_HOME")
                            (concat (getenv "HOME") "/.local/share"))
                    "/fonts/"))
              (mac (concat (getenv "HOME") "/Library/Fonts/" ))
              (ns (concat (getenv "HOME") "/Library/Fonts/" )))))
    (unless (file-directory-p font-dest) (mkdir font-dest t))
    (url-copy-file font-url (expand-file-name font-name font-dest) t)
    (message "Fonts downloaded, updating font cache... <fc-cache -f -v> ")
    (shell-command-to-string (format "fc-cache -f -v"))
    (message "Successfully install `fira-code' font to `%s'!" font-dest)))

(def lm-setup-fira-code-font
  ;; (unless (member "Fira Code" (font-family-list))
  ;;   (lm-install-fira-code-font))
  ;; Fira Code enabled
  ;; https://github.com/tonsky/FiraCode/wiki/Setting-up-Emacs
  (when (window-system)
    (set-frame-font "Fira Code Retina-17"))
  (let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
                  (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
                  (36 . ".\\(?:>\\)")
                  (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
                  (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
                  (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
                  (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
                  (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
                  (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
                  (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
                  (48 . ".\\(?:x[a-zA-Z]\\)")
                  (58 . ".\\(?:::\\|[:=]\\)")
                  (59 . ".\\(?:;;\\|;\\)")
                  (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
                  (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
                  (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
                  (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
                  (91 . ".\\(?:]\\)")
                  (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
                  (94 . ".\\(?:=\\)")
                  (119 . ".\\(?:ww\\)")
                  (123 . ".\\(?:-\\)")
                  (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
                  (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
                  )
          ))
    (dolist (char-regexp alist)
      (set-char-table-range composition-function-table (car char-regexp)
        `([,(cdr char-regexp) 0 font-shape-gstring])))))

(def setup-windows-hook
  (run-with-idle-timer 0.1 nil (lambda nil (toggle-frame-maximized)))
  (when (eq system-type 'darwin)
    (setq mac-allow-anti-aliasing t)  ;; nice fonts in OS X
    (set-face-attribute 'default nil :height 135))
  (when (eq system-type 'gnu/linux)
    (set-face-attribute 'default nil :height 116))
                                        ;(lm-setup-fira-code-font)
  (when (window-system)
    (set-frame-font "Fira Code Retina-17"))
  (setq-default truncate-lines 1)  ;; no word wrap
  (setq-default line-spacing 4)
  (use-package all-the-icons)
  (use-package zerodark-theme
    :config
    (load-theme 'zerodark 1)
    ;; (zerodark-setup-modeline-format)
    (setq zerodark-use-paddings-in-mode-line nil)
    (set-cursor-color "violet")
    ))

(add-hook 'emacs-startup-hook #'setup-windows-hook)

(use-package rainbow-mode
  :commands rainbow-mode)

(use-package origami
  :init
  (global-origami-mode 1))

(use-package hl-line
  :config
  ;; Doesn't seem to play nice in emacs 25+
  (defvar-local current-hl-line-mode nil)
  (setq hl-line-sticky-flag nil)
  (setq global-hl-line-sticky-flag nil)
  (defun hl-line-on ()  (if current-hl-line-mode (hl-line-mode +1)))
  (defun hl-line-off () (if current-hl-line-mode (hl-line-mode -1)))
  ;;(add-hook hl-line-mode (lambda () (if current-hl-line-mode (setq current-hl-line-mode t))))
  (global-hl-line-mode))

(use-package hlinum
  :config
  (hlinum-activate))

(use-package linum
  :config
  (setq linum-format " %3d ")
  (global-linum-mode nil)
  :init
  (add-hook 'prog-mode-hook #'linum-mode))

(provide 'module-appearance)
;;; module-appearance.el ends here

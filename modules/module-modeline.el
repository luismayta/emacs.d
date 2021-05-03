;;; module-modeline.el --- modeline niceties.

(use-package doom-modeline
  :hook (after-init . doom-modeline-mode)
  :init
  (display-battery-mode t)
  :config
  ;; How tall the mode-line should be (only respected in GUI Emacs).
  (setq doom-modeline-height 40)
  (setq doom-modeline-buffer-state-icon t)
  (setq doom-modeline-buffer-modification-icon t)
  (setq doom-modeline-modal-icon t)
  (setq doom-modeline-buffer-encoding nil)

  ;; How wide the mode-line bar should be (only respected in GUI Emacs).
  (setq doom-modeline-bar-width 3)

  ;; Please refer to https://github.com/bbatsov/projectile/issues/657.
  (setq doom-modeline-buffer-file-name-style 'truncate-with-project)

  ;; Whether show `all-the-icons' or not (if nil nothing will be showed).
  (setq doom-modeline-icon (display-graphic-p))

  ;; Whether show the icon for major mode. It respects `doom-modeline-icon'.
  (setq doom-modeline-major-mode-icon t)

  ;; Display color icons for `major-mode'. It respects `all-the-icons-color-icons'.
  (setq doom-modeline-major-mode-color-icon t)

  ;; Whether display minor modes or not. Non-nil to display in mode-line.
  (setq doom-modeline-minor-modes nil)

  ;; If non-nil, a word count will be added to the selection-info modeline segment.
  (setq doom-modeline-enable-word-count nil)

  ;; If non-nil, only display one number for checker information if applicable.
  (setq doom-modeline-checker-simple-format t)

  ;; Whether display perspective name or not. Non-nil to display in mode-line.
  (setq doom-modeline-persp-name t)

  ;; Whether display `lsp' state or not. Non-nil to display in mode-line.
  (setq doom-modeline-lsp t)

  ;; Whether display github notifications or not. Requires `ghub` package.
  (setq doom-modeline-github t)

  ;; The interval of checking github.
  (setq doom-modeline-github-interval (* 30 60))

  ;; Whether display environment version or not
  (setq doom-modeline-env-version t)
  ;; Or for individual languages
  (setq doom-modeline-env-enable-python t)
  (setq doom-modeline-env-enable-ruby t)
  (setq doom-modeline-env-enable-perl t)
  (setq doom-modeline-env-enable-go t)
  (setq doom-modeline-env-enable-elixir t)
  (setq doom-modeline-env-enable-rust t)

  ;; Change the executables to use for the language version string
  (setq doom-modeline-env-python-executable "python")
  (setq doom-modeline-env-ruby-executable "ruby")
  (setq doom-modeline-env-perl-executable "perl")
  (setq doom-modeline-env-go-executable "go")
  (setq doom-modeline-env-elixir-executable "iex")
  (setq doom-modeline-env-rust-executable "rustc")

  ;; Whether display mu4e notifications or not. Requires `mu4e-alert' package.
  (setq doom-modeline-mu4e t)

  ;; Whether display irc notifications or not. Requires `circe' package.
  (setq doom-modeline-irc t)

  ;; Function to stylize the irc buffer names.
  (setq doom-modeline-irc-stylize 'identity)

  (line-number-mode 0)
  (column-number-mode 0)
  )

;; setup nyan-mode cat
(use-package nyan-mode
  :after (doom-modeline)
  :hook (doom-modeline-mode . nyan-mode)
  :config
  (nyan-mode 1)
  (setq nyan-animate-nyancat t)
  )

(provide 'module-modeline)
;;; module-modeline.el ends here

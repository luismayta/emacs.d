;;; module-coding-general.el --- General coding-related config.
;;; code:
;; EditorConfig.org -- project-local coding style definitions.

(use-package editorconfig
  :commands editorconfig-mode
  :init (add-hook 'prog-mode-hook #'editorconfig-mode)
  :config
  (progn
    (add-to-list 'editorconfig-indentation-alist
      '(swift-mode swift-indent-offset))))

(use-package feature-mode
  :mode (("\\.feature$" . feature-mode)))

(use-package fixmee
  :init
  (fixmee-mode)
  (global-fixmee-mode t))

(use-package goto-last-change)

;; highlight-numbers
;; Highlights magic numbers in programming modes.
(use-package highlight-numbers
  :commands highlight-numbers-mode
  :init
  (add-hook 'prog-mode-hook #'highlight-numbers-mode))

;; rainbow-delimiters
;; Highlights parens, brackets, and braces according to their depth.
(use-package rainbow-delimiters
  :commands rainbow-delimiters-mode
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;; flycheck
(use-package flycheck
  :commands flycheck-mode
  :diminish " ✓"
  :init (add-hook 'prog-mode-hook #'flycheck-mode)
  :config (setq flycheck-emacs-lisp-load-path 'inherit))

;; flycheck-plantuml
(use-package flycheck-plantuml)

;; restclient
;; Runs REST queries from a query sheet and pretty-prints responses.
(use-package restclient
  :commands restclient-mode
  :mode
  (("\\.http$" . restclient-mode)))

;; yaml
(use-package yaml-mode
  :mode
  (("\\.yml$" . yaml-mode)
    ("\\.yaml$" . yaml-mode)))

;; wakatime for developer
(use-package wakatime-mode
  :config
  (setq wakatime-api-key (getenv "WAKATIME_API_KEY"))
  (setq wakatime-cli-path (getenv "WAKATIME_CLI_PATH"))
  (setq wakatime-python-bin (getenv "WAKATIME_PYTHON_BIN"))
  :init
  (setq inhibit-startup-screen t)
  (global-wakatime-mode t))

(use-package plantuml-mode
  :init
  (setq plantuml-jar-path (getenv "PLANTUML_JAR_PATH"))
  :mode
  (("\\.puml$" . plantuml-mode)
    ("\\.plantuml$" . plantuml-mode)))

(provide 'module-coding-general)
;;; module-coding-general.el ends here
;;; lm-modules.el --- Configures available modules and the package manager.

;;; code:

;; Repositories
;; The ELPA repositories from where the packages are fetched.
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                          ("melpa" . "http://melpa.org/packages/")
                          ("org" . "http://orgmode.org/elpa/")
                          ("elpy" . "https://jorgenschaefer.github.io/packages/")
                          ("marmalade" . "http://marmalade-repo.org/packages/")))

;; Refresh the archive if we have no local cache.
(unless package-archive-contents
  (package-refresh-contents))

(setq lm/modules
  '(dash-settings
      clipboard-settings
      confmode-settings
      environments-settings
      editorconfig-settings
      flycheck-settings
      helm-settings
      helm-ag-settings
      helm-gtags-settings
      haskell-settings
      fixmee-settings
      projectile-settings
      theme-settings
      terraform-settings
      feature-settings
      google-translate-settings
      skeletor-settings
      yasnippet-settings
      company-settings
      emamux-settings
      indent-guide-settings
      git-settings
      gist-settings
      go-settings
      ruby-settings
      php-settings
      webmode-settings
      css-settings
      csv-settings
      yaml-settings
      markdown-settings
      python-settings
      smartparens-settings
      nginx-settings
      sml-modeline-settings
      git-gutter-plus-settings
      wakatime-settings
      smartparens-settings
      rainbow-delimiters-settings
      undo-tree-settings
      neotree-settings
      evil-settings
     )
  )

(defun lm/load-modules ()
  (interactive)
  (dolist (module lm/modules) (require module)))

(provide 'lm-modules)

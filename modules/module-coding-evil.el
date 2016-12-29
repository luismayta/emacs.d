;; Install Packages
;;; code:
(use-package evil-numbers)

(use-package evil-nerd-commenter
  :config
  (evilnc-default-hotkeys))

(use-package evil
  :init
  (progn
    ;; if we don't have this evil overwrites the cursor color
    (setq evil-default-cursor t)
    ;; (setq expand-region-contract-fast-key "z")
    ;; leader shortcuts

    ;; This has to be before we invoke evil-mode due to:
    ;; https://github.com/cofi/evil-leader/issues/10
    (use-package evil-leader
      :init (global-evil-leader-mode)
      :config
      (progn
        (evil-leader/set-leader ",")
        (setq evil-leader/in-all-states t)
        ;; keyboard shortcuts
        (evil-leader/set-key
          "u" 'undo-tree-visualize
          "c" 'evilnc-comment-or-uncomment-lines
          "fa" 'origami-toggle-all-nodes
          "fr" 'origami-recursively-toggle-node
          "fe" 'find-file
          "ff" 'helm-ag-project-root
          "fp" 'helm-projectile-find-file
          "fm" 'fixmee-view-listing
          "gs" 'magit-status
          "gc" 'magit-commit
          "gd" 'magit-diff
          "gl" 'gist-list
          "gb" 'gist-buffer
          "gt" 'google-translate-smooth-translate
          "gp" 'google-translate-at-point
          "b" 'helm-mini
          "s" 'save-buffer
          "tt" 'helm-gtags-find-tag
          "tc" 'helm-gtags-create-tags
          "k" 'kill-buffer
          "xx" 'er/expand-region
          "/" 'helm-ag-this-file
          "n" 'neotree-toggle
          "p" 'plantuml-preview)))
    ;; boot evil by default
    (evil-mode 1)))

(provide 'module-coding-evil)
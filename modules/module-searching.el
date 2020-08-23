;; ag (silver surfer)
(use-package ag
  :bind ("C-c s" . ag)
  :config (setq ag-highlight-search t))

;; engine
;; Search engines integrated into Emacs.
(use-package engine-mode
  :requires (evil-leader)
  :commands (engine/search-github engine/search-google)
  :bind (("C-c / g" . engine/search-google)
          ("C-c / h" . engine/search-github))
  :config
  (setq engine/browser-function 'eww-browse-url)
  (defengine github
    "https://github.com/search?ref=simplesearch&q=%s"
    :keybinding "h")
  (defengine google
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
    :keybinding "g")
  :init
  (evil-leader/set-key "gg" 'engine/search-google)
  (evil-leader/set-key "gh" 'engine/search-github)
  )

(provide 'module-searching)
;;; module-searching.el ends here

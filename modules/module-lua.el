;;; module-lua.el --- lua settings.
;;; code:

(use-package lua-mode
  :ensure t
  :mode
  ("\\.lua\\'")
  :hook
  (lua-mode . lsp-deferred)
  :interpreter "lua"
  :config
  (setq lua-indent-level                 4
    lua-indent-string-contents       t
    lua-prefix-key                   nil))

(provide 'module-lua)
;;; module-lua.el ends here

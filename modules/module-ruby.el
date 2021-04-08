;;; module-ruby.el --- Ruby configuration.

(use-package ruby-mode
  :ensure-system-package
  ((solargraph     . "gem install solargraph")
   (bundler . "gem install bundler")
   (ruby-lint   . "gem install ruby-lint")
   (ripper-tags . "gem install ripper-tags")
   (pry         . "gem install pry"))
  :mode (("Fastfile$" . ruby-mode)
          ("Appfile$" . ruby-mode))
  :init
  (add-hook 'ruby-mode-hook 'lsp-deferred))

(provide 'module-ruby)
;;; module-ruby.el ends here

;;; module-ruby.el --- Ruby configuration.

(use-package ruby-mode
  :ensure-system-package
  ((solargraph     . "gem install solargraph")
    (bundler . "gem install bundler")
    (ruby-lint   . "gem install ruby-lint")
    (ripper-tags . "gem install ripper-tags")
    (rubocop . "gem install rubocop")
    (pry         . "gem install pry"))
  :mode (("Fastfile$" . ruby-mode)
          ("Appfile$" . ruby-mode))
  :hook
  (ruby-mode . lsp-deferred))

(provide 'module-ruby)
;;; module-ruby.el ends here

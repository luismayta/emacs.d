;; module/elixir.el --- Elixir configuration.

;; code:
(use-package elixir-mode
  :mode (("\\.ex\\'" . elixir-mode)
          ("\\.exs\\'" . elixir-mode))
  :config
  (company-quickhelp-mode -1)
  (use-package alchemist
    :diminish alchemist-mode))

(provide 'module/elixir)
;; module/elixir.el ends here

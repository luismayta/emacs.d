;;; lm-coding-elixir.el --- Elixir configuration.

(use-package elixir-mode
  :mode (("\\.ex\\'" . elixir-mode)
         ("\\.exs\\'" . elixir-mode))
  :config
  (company-quickhelp-mode -1)
  (use-package alchemist
    :diminish alchemist-mode))

(provide 'lm-coding-elixir)

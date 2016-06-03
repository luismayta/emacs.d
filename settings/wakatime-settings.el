;; -*- Emacs-Lisp -*-
;; Settings for `wakatime-mode'.

(bundle 'wakatime-mode nil)

(require 'wakatime-mode)
(setq wakatime-api-key (getenv "WAKATIME_API_KEY"))
(setq wakatime-cli-path (getenv "WAKATIME_CLI_PATH"))

(global-wakatime-mode)

(provide 'wakatime-settings)
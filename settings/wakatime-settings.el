;; -*- Emacs-Lisp -*-
;; Settings for `wakatime-mode'.

(bundle 'wakatime-mode nil)

(setq wakatime-api-key (getenv "WAKATIME_API_KEY"))
(setq wakatime-cli-path (getenv "WAKATIME_CLI_PATH"))
(setq wakatime-python-bin (getenv "WAKATIME_PYTHON_BIN"))

(require 'wakatime-mode)
(setq inhibit-startup-screen t)

(global-wakatime-mode t)

(provide 'wakatime-settings)
;; Install packages Google Translate

(bundle 'google-translate nil)

(require 'google-translate)
(require 'google-translate-smooth-ui)

;; mapping keys evil leader
(evil-leader/set-key
  "ct" 'google-translate-smooth-translate
  "gt" 'kill-buffer)
;; google-translate-default-source-language
;; google-translate-default-target-language

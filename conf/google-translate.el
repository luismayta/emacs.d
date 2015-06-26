;; Install packages Google Translate

(bundle 'google-translate nil)

(require 'google-translate)
(require 'google-translate-smooth-ui)

;; mapping keys evil leader
(evil-leader/set-key
  "gt" 'google-translate-smooth-translate
  "gp" 'google-translate-at-point)

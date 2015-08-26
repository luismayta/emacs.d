;; python configuration
(bundle 'python-mode nil)

(require 'python-mode)

;; (bundle 'jedi nil)
;; (require 'jedi)

;; (add-hook 'python-mode-hook
;;   (lambda ()
;;     (jedi:setup)
;;     (setq jedi:setup-keys t)
;;     ;(elpy-enable)
;;     ;(elpy-use-ipython)
;;     (setq python-python-command "ipython")))

(provide 'python-settings)
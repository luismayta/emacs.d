;; complete parenthesis
;(setq skeleton-pair t)
;(global-set-key "[" 'skeleton-pair-insert-maybe)
;(global-set-key "(" 'skeleton-pair-insert-maybe)
;(global-set-key "{" 'skeleton-pair-insert-maybe)
;(global-set-key "'" 'skeleton-pair-insert-maybe)
;(global-set-key "\"" 'skeleton-pair-insert-maybe)

;; make jedi-mode
(autoload 'jedi:setup "jedi" nil t)
(setq jedi:setup-keys t)

;;python mode
(add-hook 'python-mode-hook
  (lambda ()
    (jedi:setup)
    ;(elpy-enable)
    ;(elpy-use-ipython)
    (setq python-python-command "ipython")))

;; Don't move back the cursor one position when exiting insert mode' 
(setq evil-move-cursor-back nil)

;; evil leader 
(global-evil-leader-mode)

;;set evil leader
(evil-leader/set-leader ",")

;; mapping keys evil leader
(evil-leader/set-key
  "e" 'find-file
  "n" 'neotree-toggle
  "f" 'fiplr-find-file
  "b" 'switch-to-buffer
  "k" 'kill-buffer)

;; show whitespace...
(global-whitespace-mode t)

;; reload changes from disk
(global-auto-revert-mode t)

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
    (setq python-python-command "ipython")))

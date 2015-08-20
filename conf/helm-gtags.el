;; Install Packages
(bundle 'helm-gtags nil)

(require 'helm-gtags)

;;; Enable helm-gtags-mode
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)
(add-hook 'python-mode-hook 'helm-gtags-mode)
(add-hook 'web-mode-hook 'helm-gtags-mode)
(add-hook 'go-mode-hook 'helm-gtags-mode)
(add-hook 'yml-mode-hook 'helm-gtags-mode)
(add-hook 'js2-mode-hook 'helm-gtags-mode)

;; customize
(custom-set-variables
  '(helm-gtags-path-style 'relative)
  '(helm-gtags-ignore-case t)
  '(helm-gtags-auto-update t))

;; mapping keys evil leader
(evil-leader/set-key
  "tt" 'helm-gtags-find-tag
  "tc" 'helm-gtags-create-tags
  )

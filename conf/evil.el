;; Install Packages
(bundle 'evil nil)
(bundle 'evil-leader nil)
(bundle 'evil-numbers nil)
(bundle 'evil-nerd-commenter nil)

(require 'evil)
(require 'evil-numbers)
(require 'evil-leader)
(require 'evil-nerd-commenter)

;; emacs is actually vim in disguise
(evil-mode t)

;; hotkeys evil comment
(evilnc-default-hotkeys)
;; evil leader
(global-evil-leader-mode t)

;;set evil leader
(evil-leader/set-leader ",")

;; Don't move back the cursor one position when exiting insert mode'
(setq evil-move-cursor-back nil)

;; mapping keys evil leader
(evil-leader/set-key
  "e" 'find-file
  "n" 'neotree-toggle
  "f" 'fiplr-find-file
  "b" 'switch-to-buffer
  "k" 'kill-buffer)

;; evil normal mode key mappings
(mapc (lambda (mapping)
        (define-key evil-normal-state-map (kbd (car mapping)) (cdr mapping)))
      `(;; increment number under point
        ("C-k"   . evil-numbers/inc-at-pt)
        ;; decrement number under point
        ("C-j"   . evil-numbers/dec-at-pt)))

;; allow the arrow keys to be used for cycling windows
(mapc (lambda (keys)
        (let ((letter (format "C-w %s" (car keys)))
              (arrow  (format "C-w %s" (cdr keys))))
          (define-key evil-normal-state-map (kbd arrow) (kbd letter))
          (define-key evil-motion-state-map (kbd arrow) (kbd letter))
          (define-key evil-visual-state-map (kbd arrow) (kbd letter))))
      '(("h" . "<left>")
        ("j" . "<down>")
        ("k" . "<up>")
        ("l" . "<right>")))

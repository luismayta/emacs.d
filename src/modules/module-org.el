;; install orgmode
(use-package org
  :ensure t
  :mode ("\\.org\\'" . org-mode)
  ;; :init (setq org-todo-keywords '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))
  :config
  (setq org-highlight-latex-and-related '(latex))
  ;; labels kanban
  (setq org-todo-keywords
    '((sequence "TODO" "DOING" "BLOCKED" "REVIEW" "|" "DONE" "ARCHIVED")))
  ;; Setting Colours (faces) for todo states to give clearer view of work
  (setq org-todo-keyword-faces
    '(("TODO" . org-warning)
       ("DOING" . "yellow")
       ("BLOCKED" . "red")
       ("REVIEW" . "orange")
       ("DONE" . "green")
       ("ARCHIVED" .  "blue")))
  )
;;(use-package org-capture)

(use-package org-bullets
  :ensure t
  :commands (org-bullets-mode)
  :init (add-hook
          'org-mode-hook (lambda () (org-bullets-mode 1))))

(provide 'module-org)
;;; module-org.el ends here

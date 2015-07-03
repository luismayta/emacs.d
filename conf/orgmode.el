;; install orgmode
(require 'org-mode)
(require 'org-capture)
;; Emacs Org-mode for managing TODO’s using a Kanban style workflow

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

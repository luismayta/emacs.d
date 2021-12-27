;;; module-org.el --- Org mode configurations -*- lexical-binding: t -*-

;;; Commentary:
;;

;;; Code:

(use-package org
  :ensure nil
  :mode ("\\.org\\'" . org-mode)
  :hook ((org-mode . auto-fill-mode)
         (org-mode . visual-line-mode))
  :commands (org-find-exact-headline-in-buffer org-set-tags)
  :custom-face
  (org-document-title ((t (:height 1.75 :weight bold))))
  :bind (("C-c l" . org-store-link)
         ("C-c a" . org-agenda)
         ("C-c c" . org-capture)
         :map org-mode-map
         ("s-K" . org-priority-up)
         ("s-J" . org-priority-down))
  :custom
  (org-modules '(ol-info org-habit org-protocol org-tempo ol-eww))
  (org-directory (concat (getenv "HOME") "/Documents/notes/"))
  (org-tags-column -80)
  (org-pretty-entities t)
  (org-imenu-depth 4)
  (org-startup-indented t)
  (org-startup-with-inline-images t)
  (org-return-follows-link t)
  (org-image-actual-width nil)
  (org-hide-emphasis-markers t)
  (org-fontify-done-headline t)
  (org-fontify-whole-heading-line t)
  (org-fontify-quote-and-verse-blocks t)
  (org-catch-invisible-edits 'smart)
  (org-insert-heading-respect-content t)
  (org-hide-block-all t)
  (org-yank-adjusted-subtrees t)
  ;; block switching the parent to done state
  (org-enforce-todo-dependencies t)
  (org-enforce-todo-checkbox-dependencies t)
  ;; nice look
  (org-ellipsis " ▼ ")
  (org-list-demote-modify-bullet '(("+" . "-") ("1." . "a.") ("-" . "+")))
  (org-todo-keywords '((sequence "TODO(t)" "INPROGRESS(i!)" "WAITING(w!)"
                                 "|" "DONE(d!)" "CANCELLED(c!)")))
  (org-todo-keyword-faces
   '(("TODO"       :foreground "#7c7c75" :weight bold)
     ("INPROGRESS" :foreground "#0098dd" :weight bold)
     ("WAITING"    :foreground "#9f7efe" :weight bold)
     ("DONE"       :foreground "#50a14f" :weight bold)
     ("CANCELLED"  :foreground "#ff6480" :weight bold)))
  (org-highest-priority ?A)
  (org-lowest-priority ?E)
  (org-default-priority ?C)
  (org-priority-faces '((?A :foreground "red")
                        (?B :foreground "orange")
                        (?C :foreground "yellow")
                        (?D :foreground "green")
                        (?E :foreground "blue")))
  ;; log
  (org-log-done 'time)
  (org-log-repeat 'time)
  (org-log-redeadline 'note)
  (org-log-reschedule 'note)
  (org-log-into-drawer t)
  (org-log-state-notes-insert-after-drawers nil)
  ;; refile
  (org-refile-use-cache nil)
  (org-refile-targets '((org-agenda-files . (:maxlevel . 6))))
  (org-refile-use-outline-path 'file)
  (org-outline-path-complete-in-steps nil)
  (org-refile-allow-creating-parent-nodes 'confirm)
  ;; tags
  (org-fast-tag-selection-single-key t)
  (org-tag-alist '((:startgroup)
                   ("HandsOn" . ?o)
                   (:grouptags)
                   ("Write" . ?w) ("Code" . ?c) ("Project" . ?p) ("Bug" . ?g)
                   (:endgroup)
                   (:startgroup)
                   ("HandsOff" . ?f)
                   (:grouptags)
                   ("Read" . ?r) ("View" . ?v) ("Listen" . ?l)
                   (:endgroup)
                   ("Mail" . ?@) ("Buy" . ?b)))
  ;; archive
  (org-archive-location "%s_archive::date-tree")
  :config
  ;; latex preview
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 1.6)))

(use-package evil-org
  :ensure t
  :after (org evil)
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

;; Keep track of tasks
(use-package org-agenda
  :ensure nil
  :after org
  :custom
  (org-agenda-files `(,org-directory))
  ;; (org-agenda-diary-file (expand-file-name "diary.org" org-directory))
  ;; (org-agenda-insert-diary-extract-time t)
  (org-agenda-compact-blocks t)
  (org-agenda-block-separator nil)
  (org-habit-show-habits t)
  (org-agenda-sticky t)
  (org-agenda-span 10)
  (org-agenda-include-diary nil)
  (org-agenda-include-deadlines t)
  (org-agenda-inhibit-startup t)
  (org-agenda-show-all-dates t)
  (org-agenda-time-leading-zero t)
  (org-agenda-start-with-log-mode t)
  (org-agenda-start-with-clockreport-mode t)
  (org-agenda-hide-tags-regexp ":\\w+:")
  (org-agenda-todo-ignore-with-date nil)
  (org-agenda-todo-ignore-deadlines nil)
  (org-agenda-todo-ignore-scheduled nil)
  (org-agenda-todo-ignore-timestamp nil)
  (org-agenda-skip-deadline-if-done t)
  (org-agenda-skip-scheduled-if-done t)
  (org-agenda-skip-timestamp-if-done t)
  (org-agenda-skip-unavailable-files t)
  (org-agenda-text-search-extra-files '(agenda-archives))
  (org-agenda-clockreport-parameter-plist
   '(:link t :maxlevel 5 :fileskip0 t :compact nil :narrow 80))
  (org-agenda-columns-add-appointments-to-effort-sum t)
  (org-agenda-restore-windows-after-quit t)
  (org-agenda-window-setup 'current-window)
  ;; starts from Monday
  (org-agenda-start-on-weekday 1)
  (org-agenda-use-time-grid t)
  (org-agenda-timegrid-use-ampm nil)
  (org-agenda-time-grid '((daily tody require-timed)
                          (300 600 900 1200 1500 1800 2100 2400)
                          "......" "----------------"))
  (org-agenda-search-headline-for-time nil))

;; Record the time
(use-package org-clock
  :ensure nil
  :after org
  :functions notifications-notify
  :custom
  (org-clock-in-resume t)
  (org-clock-idle-time 15)
  (org-clock-into-drawer t)
  (org-clock-out-when-done t)
  (org-clock-persist 'history)
  (org-clock-history-length 20)
  (org-clock-mode-line-total 'current)
  (org-clock-display-default-range 'thismonth)
  (org-clock-in-switch-to-state "INPROGRESS")
  (org-clock-out-switch-to-state "WAITING")
  (org-clock-out-remove-zero-time-clocks t)
  (org-clock-report-include-clocking-task t)
  (org-show-notification-handler (lambda (msg)
                                   (notifications-notify :title "Org Clock"
                                                         :body msg
                                                         :timeout 5000
                                                         :urgency 'critical)))
  (org-clock-clocktable-default-properties '(:block day :maxlevel 3 :scope agenda
                                             :link t :compact t :formula % :step day
                                             :fileskip0 t :stepskip0 t :narrow 80
                                             :properties ("CLOCKSUM" "CLOCKSUM_T"
                                                          "TODO")))
  :config
  (org-clock-persistence-insinuate))

;; Write codes in org-mode
(use-package org-src
  :ensure nil
  :after org
  :bind (:map org-src-mode-map
              ;; consistent with separedit/magit
              ("C-c C-c" . org-edit-src-exit))
  :custom
  (org-src-fontify-natively t)
  (org-src-tab-acts-natively t)
  (org-src-preserve-indentation t)
  (org-src-window-setup 'current-window)
  (org-confirm-babel-evaluate nil)
  (org-edit-src-content-indentation 0)
  (org-babel-load-languages '((awk        . t)
                              (C          . t)
                              (dot        . t)
                              (go         . t)
                              (rust       . t)
                              (emacs-lisp . t)
                              (ocaml      . t)
                              (python     . t)
                              (shell      . t)
                              (sql        . t))))

;; Rich text clipboard
(use-package org-rich-yank
  :ensure t
  :bind (:map org-mode-map
              ("C-M-y" . org-rich-yank)))

(use-package org-id
  :ensure nil
  :after org
  :custom
  (org-id-link-to-org-use-id 'create-if-interactive-and-no-custom-id))

;; Create structured information quickly
(use-package org-capture
  :ensure nil
  :after org doct
  :custom
  (org-capture-use-agenda-date t)
  ;; https://www.reddit.com/r/emacs/comments/fs7tk3/how_to_manage_todo_tasks_in_my_project/
  (org-capture-templates
   (doct '(("Task" :keys "t" :file "task.org" :children
            (("Tasks" :keys "t" :type entry :headline "Tasks" :clock-in t :clock-resume t
              :datetree t :tree-type week :template "* TODO %?\n %i\n %a\n")
             ("Reading" :keys "r" :type entry :headline "Reading"
              :template "* TODO %^{name}\n %a\n")
             ("Learning" :keys "l" :type entry :headline "Learning"
              :template "* TODO %^{name}\n %a\n")
             ("Reminder" :keys "n" :type checkitem :headline "Non-recurring"
              :template "[ ][#B] %i%?")))
           ("Capture" :keys "c" :file "capture.org" :children
            (("Thoughts" :keys "t" :type plain :headline "Thoughts"
              :template "** %T %?\n")
             ("Bookmarks" :keys "b" :type entry :headline "Bookmarks"
              :template "* [[%^{link}][%^{description}]] :READ:\n %a\n %i")
             ("Code Snippets" :keys "c" :type plain :headline "Code Snippets"
              :template "** %T\n#+begin_src %?\n\n#+end_src\n %i")
             ("Code Snippets From Clipboard" :keys "x" :type plain :headline "Code Snippets"
              :template "** %T\n#+begin_src\n%x%?#+end_src\n %i")))
           ("Project"
            :keys "p"
            :file (lambda ()
                     (let ((file (expand-file-name "TODO.org"
                                                   (when (functionp 'projectile-project-root)
                                                     (projectile-project-root)))))
                       (with-current-buffer (find-file-noselect file)
                         (org-mode)
                         ;; Set to UTF-8 because we may be visiting raw file
                         (setq buffer-file-coding-system 'utf-8-unix)
                         (when-let* ((headline (doct-get :headline)))
                           (unless (org-find-exact-headline-in-buffer headline)
                             (goto-char (point-max))
                             (insert "* " headline)
                             (org-set-tags (downcase headline))))
                         file)))
            :template (lambda () (concat "* %{todo-state} " (when (y-or-n-p "Link? ") "%A\n") "%?"))
            :todo-state "TODO"
            :children (("bug"           :keys "b" :headline "Bugs")
                       ("documentation" :keys "d" :headline "Documentation")
                       ("enhancement"   :keys "e" :headline "Enhancements")
                       ("feature"       :keys "f" :headline "Features")
                       ("optimization"  :keys "o" :headline "Optimizations")
                       ("miscellaneous" :keys "m" :headline "Miscellaneous")
                       ("security"      :keys "s" :headline "Security")))
           ("Work" :keys "w" :file "work.org" :children
            ("Works" :keys "w" :headline "Works" :type entry :clock-in t :clock-resume t
             :datetree t :tree-type week :template "* TODO %?\n %i\n"))))))

;; org links
(use-package ol
  :ensure nil
  :after org
  :custom
  (org-link-keep-stored-after-insertion t)
  (org-link-abbrev-alist '(("wg21"      . "https://wg21.link/%s")
                           ("github"    . "https://github.com/%s")
                           ("youtube"   . "https://youtube.com/watch?v=%s")
                           ("wikipedia" . "https://en.wikipedia.org/wiki/%s")
                           ("google"    . "https://google.com/search?q=")))
  )

;; export
(use-package ox
  :ensure nil
  :after org
  :custom
  (org-export-with-toc t)
  (org-export-with-email t)
  (org-export-with-author t)
  (org-export-with-drawers nil)
  (org-export-with-properties t)
  (org-export-with-footnotes t)
  (org-export-with-smart-quotes t)
  (org-export-with-section-numbers t)
  (org-export-with-sub-superscripts nil)
  (org-export-use-babel nil)
  (org-export-headline-levels 5)
  (org-export-coding-system 'utf-8)
  (org-export-with-broken-links 'mark)
  (org-export-backends '(ascii html md)))

(use-package ox-html
  :ensure nil
  :after org
  :custom
  (org-html-doctype "html5")
  (org-html-html5-fancy t)
  (org-html-checkbox-type 'uncode)
  (org-html-validation-link nil))

;; Pretty symbols
(use-package org-superstar
  :ensure t
  :custom
  ;; hide leading stars, rendering in spaces
  (org-hide-leading-stars nil)
  (org-superstar-leading-bullet ?\s)
  :hook (org-mode . org-superstar-mode))

;; Super agenda mode
(use-package org-super-agenda
  :ensure t
  :hook (org-agenda-mode . org-super-agenda-mode)
  :custom
  (org-super-agenda-groups '((:log t)
                             (:name "Schedule" :time-grid t)
                             (:name "Scheduled" :scheduled past)
                             (:name "Today" :scheduled today)
                             (:name "Due today" :deadline today)
                             (:name "Overdue" :deadline past)
                             (:name "Due soon" :deadline future)
                             (:name "Important" :priority>= "B")
                             (:name "Started" :todo "INPROGRESS" :order 6)
                             (:todo "WAITING" :order 9)))
  )

;; Presentation
(use-package org-tree-slide
  :ensure t
  :bind (:map org-mode-map
         ("C-<f8>" . org-tree-slide-mode)
         :map org-tree-slide-mode-map
         ("C-x s c" . org-tree-slide-content)
         ("C-<"     . org-tree-slide-move-previous-tree)
         ("C->"     . org-tree-slide-move-next-tree))
  :hook ((org-tree-slide-play . (lambda ()
                                  (text-scale-increase 4)
                                  (read-only-mode +1)))
         (org-tree-slide-stop . (lambda ()
                                  (text-scale-increase 0)
                                  (read-only-mode -1))))
  :custom
  (org-tree-slide-skip-outline-level 2)
  (org-tree-slide-heading-emphasis t))

;; Declarative Org Capture Templates
(use-package doct
  :ensure t
  :demand t
  :commands (doct doct-get))

;; Ensure that emacsclient.desktop exists and server-mode is opened.
;;
;; cat > ~/.local/share/applications/emacsclient.desktop << EOF
;; [Desktop Entry]
;; Name=Emacs Client
;; Exec=emacsclient %u
;; Icon=emacs-icon
;; Type=Application
;; Terminal=false
;; MimeType=x-scheme-handler/org-protocol;
;; EOF
(use-package org-protocol
  :ensure nil
  :after org
  :custom
  (org-protocol-default-template-key "cw"))

(use-package org-habit
  :ensure nil
  :after org
  :custom
  (org-habit-graph-column 50))

;; Diaries
(use-package org-journal
  :ensure t
  :defer t
  :after org
  :bind ("C-c j" . org-journal-new-entry)
  :custom
  (org-journal-dir (expand-file-name (concat org-directory "diary")))
  (org-journal-date-format "%A, %d %B %Y")
  (org-journal-file-format "%Y-%m-%d.org")
  (org-journal-enable-cache t)
  ;; (org-journal-date-prefix "#+title: ")
  (org-extend-today-until 6)
  :init
  (defun org-journal-file-header-func (time)
  "Custom function to create journal header."
  (concat
    (pcase org-journal-file-type
      (`daily "#+TITLE: Daily Journal\n#+STARTUP: showeverything")
      (`weekly "#+TITLE: Weekly Journal\n#+STARTUP: folded")
      (`monthly "#+TITLE: Monthly Journal\n#+STARTUP: folded")
      (`yearly "#+TITLE: Yearly Journal\n#+STARTUP: folded"))))
  (setq org-journal-file-header 'org-journal-file-header-func))

(require 'module-org-roam)
(provide 'module-org)

;;; module-org.el ends here

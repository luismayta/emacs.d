;;; module-org-roam.el --- Description.

;;; Commentary:

;;; Code:
;; Make better connection in your notes
(use-package org-roam
  :ensure t
  :after org
  :custom
  (org-roam-v2-ack t)
  (org-roam-directory (expand-file-name (concat org-directory "roam/")))
  (org-roam-buffer-no-delete-other-windows t)
  (org-roam-completion-system 'ivy)
  (org-roam-index-file (expand-file-name "index.org" org-roam-directory))
  (org-roam-graph-viewer "/Applications/Brave Browser.app/Contents/MacOS/Brave Browser")
  (org-roam-dailies-directory  "roam-daily/")
  (org-roam-db-gc-threshold most-positive-fixnum)
  (org-roam-link-title-format "R:%s")
  (org-roam-completion-everywhere t)
  (org-roam-dailies-capture-templates
   '(("s" "study" entry
      #'org-roam-capture--get-point
      "* %?"
      :file-name "daily/%<%Y-%m-%d>"
      :head "#+title: %<%Y-%m-%d>\n"
      :olp ("Study notes"))

     ("j" "journal" entry
      #'org-roam-capture--get-point
      "* %?"
      :file-name "daily/%<%Y-%m-%d>"
      :head "#+title: %<%Y-%m-%d>\n"
      :olp ("Journal"))))
  (org-roam-capture-templates
   '(("d" "default" plain
      ;; shortcut / full-name / plain | entry (for headers) | dedicated function
      "* What is it? %?" ;; The template inserted on each call to `capture'
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}"
                         "#+title: ${title}\n\n#+filetags: \n\n - tags :: \n\n")
      :unnarrowed t) ;; Tells the org-roam to show the contents of the whole file
     ))
  :bind (
              ("C-c n b" . org-roam-switch-to-buffer)
              ("C-c n c d" . org-roam-dailies-capture-today)
              ("C-c n c c" . org-roam-capture)
              ("C-c n f f" . org-roam-node-find)
              ("C-c n f d" . org-roam-dailies-find-today)
              ("C-c n g" . org-roam-graph)
              ("C-c n i" . org-roam-node-insert)
              ("C-c n j" . org-roam-jump-to-index)
              ;; ("C-c n l" . org-roam)
              ("C-c n l" . org-roam-buffer-toggle)
              ("C-c n d d" . org-roam-doctor))
  :config
  (org-roam-setup)
  (require 'org-roam-protocol)
  ;; for org-roam-buffer-toggle
  ;; Use side-window like V1
  ;; This can take advantage of slots available with it
  (add-to-list 'display-buffer-alist
               '("\\*org-roam\\*"
                 (display-buffer-in-side-window)
                 (side . right)
                 (slot . 0)
                 (window-width . 0.25)
                 (preserve-size . (t nil))
                 (window-parameters . ((no-other-window . t)
                                       (no-delete-other-windows . t)))))

  (cl-defmethod org-roam-node-directories ((node org-roam-node))
    (if-let ((dirs (file-name-directory (file-relative-name (org-roam-node-file node) org-roam-directory))))
        (format "(%s)" (car (f-split dirs)))
      ""))

  (cl-defmethod org-roam-node-backlinkscount ((node org-roam-node))
    (let* ((count (caar (org-roam-db-query
                         [:select (funcall count source)
                                  :from links
                                  :where (= dest $s1)
                                  :and (= type "id")]
                         (org-roam-node-id node)))))
      (format "[%d]" count)))

  (setq org-roam-node-display-template "${directories:10} ${tags:10} ${title:100} ${backlinkscount:6}")
  )

;; Visulize org-roam files
(use-package org-roam-ui
  :straight
    (:host github :repo "org-roam/org-roam-ui" :branch "main" :files ("*.el" "out"))
    :after org-roam
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

;; Notes manager
;; NOTE: Currently only manage org-roam files
(use-package deft
  :ensure t
  :after org
  :defer t
  :defines (org-roam-directory)
  :init (setq deft-default-extension "org")
  :bind
  ("C-c n d" . deft)
  :custom
  (deft-directory org-roam-directory)
  (deft-recursive t)
  (deft-use-filename-as-title nil)
  (deft-use-filter-string-for-filename t)
  (deft-file-naming-rules '((noslash . "-")
                            (nospace . "-")
                            (case-fn . downcase))))

;; org download
(use-package org-download
  :after org
  :bind
  (:map org-mode-map
        (("s-Y" . org-download-screenshot)
         ("s-y" . org-download-yank))))

(provide 'module-org-roam)
;;; module-org-roam.el ends here

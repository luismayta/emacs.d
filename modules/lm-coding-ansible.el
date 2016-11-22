;;; lm-ansible.el --- Ansible -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Luis Mayta

;; Author: Luis Mayta <slovacus@gmail.com>

;;; Commentary:

;;

;;; Code:

(use-package ansible
  :ensure t
  :defer t
  :after yaml-mode
  :mode
  (("ansible/group_vars/.*" . yaml-mode)
    ("ansible/host_vars/.*"  . yaml-mode))
  :init
  (after 'yaml-mode
    (add-hook 'yaml-mode-hook #'ansible))
  (after (yaml-mode yasnippet)
    (ansible::snippets-initialize)))

(use-package jinja2-mode
  :ensure t
  :mode "\\.j2?\\'")

(use-package ansible-doc
  :ensure t
  :after ansible
  :init (add-hook 'ansible::hook #'ansible-doc-mode))

(use-package company-ansible
  :ensure t
  :after ansible
  :init
  (after config-completion
    (config-completion-add-backends
     'yaml-mode
     (config-completion-backend-with-yasnippet #'company-ansible))))

(provide 'lm-coding-ansible)
;;; lm-coding-ansible.el ends here

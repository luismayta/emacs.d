;;; module-ansible.el --- Ansible -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Luis Mayta

;; Author: Luis Mayta <slovacus@gmail.com>

;;; Commentary:

;;

;;; Code:

(use-package ansible
  :ensure t
  :mode
  (("ansible/group_vars/.*" . yaml-mode)
    ("ansible/host_vars/.*"  . yaml-mode))
  :init
  (add-hook 'yaml-mode-hook #'ansible))

(use-package jinja2-mode
  :ensure t
  :mode "\\.j2?\\'")

(use-package ansible-doc
  :ensure t
  :init
  (add-hook 'ansible::hook #'ansible-doc-mode))

(use-package company-ansible
  :ensure t)

(provide 'module-ansible)
;;; module-ansible.el ends here

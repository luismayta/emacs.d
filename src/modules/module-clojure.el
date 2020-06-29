;;; module-clojure.el --- Clojure -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Luis Mayta

;; Author: Luis Mayta <slovacus@gmail.com>

;;; Commentary:

;;

;;; Code:
(use-package clojure-mode
  :ensure t
  :defer t
  :mode ("\\.clj$"  . clojure-mode)
  ("\\.edn$" . clojure-mode)
	("\\.cljs$" . clojure-mode)
	("\\.cljc$" . clojure-mode))

(provide 'module-clojure)
;;; module-clojure.el ends here

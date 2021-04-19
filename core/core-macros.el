;;; core-macros.el --- Macro definitions. -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(require 'core-vars)

;;; Convenience functions for leader bindings

(declare-function 'general-define-key "general")

(defmacro core-leader (&rest args)
  "Bind ARGS as leader bindings."
  (declare (indent 0))
  `(progn
     (require 'general)
     ,@(cl-loop for (key func doc) in args
                collect
                `(progn
                   (when ,doc
                     (which-key-add-key-based-replacements ,(concat core-leader-key " " key) ,doc))
                   (general-define-key :prefix core-leader-key :states '(normal motion) :keymaps 'override ,key ,func)))))

(provide 'core-macros)

;;; core-macros.el ends here

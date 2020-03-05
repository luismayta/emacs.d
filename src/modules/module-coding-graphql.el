;;; module-coding-graphql.el --- Graphql settings.
;;; code:

(use-package graphql-mode
  :mode ("\\.graphql\\'" "\\.gql\\'")
  :commands
  (graphql-query graphql-mutation))


(provide 'module-coding-graphql)
;;; module-coding-graphql.el ends here

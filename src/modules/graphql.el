;;; module/graphql.el --- Graphql settings.
;;; code:

(use-package graphql-mode
  :mode ("\\.graphql\\'" "\\.gql\\'")
  :commands
  (graphql-query graphql-mutation))


(provide 'module/graphql)
;;; module/graphql.el ends here

;;; module-graphql.el --- Graphql settings.
;;; code:

(use-package graphql-mode
  :quelpa (graphql-mode :fetcher github
		   :repo "davazp/graphql-mode")
  :mode (
          ("\\.graphql$" . graphql-mode)
          ("\\.graphqls$" . graphql-mode)
          ("\\.gql$" . graphql-mode)
          )
  :commands
  (graphql-query graphql-mutation))


(provide 'module-graphql)
;;; module-graphql.el ends here

;;; module-graphql.el --- Graphql settings.
;;; code:

(use-package graphql-mode
  :quelpa (graphql-mode :fetcher github
		        :repo "davazp/graphql-mode")
	:ensure-system-package
	(graphql-lsp . "yarn global add graphql-language-service-cli graphql")
  :mode (
          ("\\.graphql$" . graphql-mode)
          ("\\.graphqls$" . graphql-mode)
          ("\\.gql$" . graphql-mode)
          )
  :commands
  (graphql-query graphql-mutation))


(provide 'module-graphql)
;;; module-graphql.el ends here

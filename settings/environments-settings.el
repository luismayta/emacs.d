(bundle 'exec-path-from-shell nil)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

(provide 'environments-settings)

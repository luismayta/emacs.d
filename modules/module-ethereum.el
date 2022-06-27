;;; module-ethereum.el --- Configure solidity-mode -*- lexical-binding: t -*-
;;; code:

(use-package solidity-mode
:ensure-system-package
  (
    (solcjs . "yarn global add solc")
    (solium . "yarn global add ethlint")
    )
  )

(use-package solidity-flycheck
  :straight t
  :defer 20
  :ensure t)

(use-package company-solidity
  :straight t
  :defer 20
  :ensure t)

(provide 'module-ethereum)
;;; module-ethereum.el ends here

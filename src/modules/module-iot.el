;;; module-iot.el --- Arduino -*- lexical-binding: t; -*-

;; Copyright (C) 2019  Luis Mayta

;; Author: Luis Mayta <slovacus@gmail.com>

;;; Commentary:

;;

;;; Code:

(use-package arduino-mode
  :ensure t
  :mode (("\\.ino\\'" . arduino-mode))
  :commands (arduino-mode flycheck-arduino-setup)
  :config (add-hook 'arduino-mode-hook #'flycheck-arduino-setup))

(use-package platformio-mode
  :ensure t
  :init (add-hook 'c++-mode-hook 'platformio-mode)
  :mode (("\\.ino\\'" . arduino-mode))
  :config (platformio-setup-compile-buffer))

(use-package irony
  :ensure t)

(use-package company-arduino
  :init
  (add-hook 'irony-mode-hook 'company-arduino-turn-on)
  :config
  (push 'company-arduino company-backends))

(use-package company-irony-c-headers
  :config
  (push 'company-irony-c-headers company-backends))

(use-package company-c-headers
  :config
  (push 'company-c-headers company-backends))

(use-package company-irony
  :after irony
  :config
  (push 'company-irony company-backends))

(provide 'module-iot)
;;; module-iot.el ends here

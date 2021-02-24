;;; module/dart.el --- Dart settings.
;;; code:

(use-package
  dart-mode
  :ensure t
  :mode "\\.dart$"
  :hook (dart-mode . electric-pair-mode)
  :config
  ;; (add-hook 'dart-mode-hook 'lsp)
  (with-eval-after-load "projectile"
    (add-to-list 'projectile-project-root-files-bottom-up "pubspec.yaml")
    (add-to-list 'projectile-project-root-files-bottom-up "BUILD"))
  (setq lsp-auto-guess-root t)
  (setq dart-sdk-path (getenv "FLUTTER_DART_SDK"))
  )

(use-package
  flutter
  :ensure t
  :after dart-mode
  :bind (:map dart-mode-map
          ("C-M-x" . #'flutter-run-or-hot-reload))
  :config
  (setq dart-sdk-path (getenv "FLUTTER_ROOT")))

(provide 'module/dart)
;;; module/dart.el ends here

;;; module-http.el --- General coding-related config.
;;; code:
;; Runs REST queries from a query sheet and pretty-prints responses.

(use-package polymode
  :config
  (with-no-warnings
    ;; js
    (define-hostmode poly-js-hostmode
      :mode 'js-mode)
    (define-innermode poly-js-graphql-innermode
      :mode 'graphql-mode
      :head-matcher "graphql[ \t\n]*(?`"
      :tail-matcher "`"
      :head-mode 'host
      :tail-mode 'host)
    ;; FIXME: Causes bad things to happen in the `js-mode' buffer.
    (define-polymode poly-js-mode
      :hostmode 'poly-js-hostmode
      :innermodes '(poly-js-graphql-innermode))

    ;; web
    (define-hostmode poly-web-hostmode
      :mode 'web-mode)
    (define-innermode poly-web-svg-innermode
      :mode 'nxml-mode
      :head-matcher "<svg"
      :tail-matcher "</svg>"
      :head-mode 'inner
      :tail-mode 'inner)
    (define-polymode poly-web-mode
      :hostmode 'poly-web-hostmode
      :innermodes '(poly-web-svg-innermode))

    ;; restclient
    (define-hostmode poly-restclient-hostmode
      :mode 'restclient-mode)
    (define-innermode poly-restclient-elisp-root-innermode
      :mode 'emacs-lisp-mode
      :head-mode 'host
      :tail-mode 'host)
    (define-innermode poly-restclient-elisp-single-innermode
      poly-restclient-elisp-root-innermode
      :head-matcher "^:[^ ]+ :="
      :tail-matcher "\n")
    (define-innermode poly-restclient-elisp-multi-innermode
      poly-restclient-elisp-root-innermode
      :head-matcher "^:[^ ]+ := <<"
      :tail-matcher "^#$")
    (define-polymode poly-restclient-mode
      :hostmode 'poly-restclient-hostmode
      :innermodes '(poly-restclient-elisp-single-innermode
                    poly-restclient-elisp-multi-innermode))

    ;; applescript
    (defun match-string-delimiter (ahead)
      "Match the delimiter of a string, forward if AHEAD is positive.
Backward if AHEAD is negative."
      (let ((re "[^\\]\""))
        (when (or (looking-at re)
                  (if (> ahead 0)
                      (re-search-forward re)
                    (re-search-backward re)))
          (cons (match-beginning 0) (match-end 0)))))

    (define-innermode poly-emacs-lisp-apples-innermode
      :mode 'apples-mode
      :head-matcher "do-applescript\s-*.*\""
      :tail-matcher #'match-string-delimiter)
    (define-polymode poly-emacs-lisp-mode
      :hostmode 'poly-emacs-lisp-hostmode
      :innermodes '(poly-emacs-lisp-apples-innermode)))

  ;;     ;; WIP
  ;;     ;; (define-innermode poly-emacs-lisp-Info-innermode
  ;;     ;;   :mode 'Info-mode
  ;;     ;;   :)

  :hook
  (js-mode-hook . poly-js-mode)
  ;; (rjsx-mode-hook . poly-rjsx-mode)
  (web-mode-hook . poly-web-mode)
  (restclient-mode-hook . poly-restclient-mode))

(use-package poly-markdown
  :hook
  (markdown-mode-hook . poly-markdown-mode))

;; (use-package polymode)

;; (use-package poly-markdown)

(use-package know-your-http-well
  :commands
  (company-restclient))

(use-package company-restclient
  :hook
  (restclient-mode . (lambda ()
                       (add-to-list (make-local-variable 'company-backends)
                                    '(company-restclient)))))

;; (define-hostmode poly-restclient-hostmode
;;   :mode 'restclient-mode)

;; (define-innermode poly-restclient-elisp-root-innermode
;;   :mode 'emacs-lisp-mode
;;   :head-mode 'host
;;   :tail-mode 'host)

;; (define-innermode poly-restclient-elisp-single-innermode poly-restclient-elisp-root-innermode
;;   :head-matcher "^:[^ ]+ :="
;;   :tail-matcher "\n")

;; (define-innermode poly-restclient-elisp-multi-innermode poly-restclient-elisp-root-innermode
;;   :head-matcher "^:[^ ]+ := <<"
;;   :tail-matcher "^#$")

;; (define-polymode poly-restclient-mode
;;   :hostmode 'poly-restclient-hostmode
;;   :innermodes '(poly-restclient-elisp-single-innermode
;; poly-restclient-elisp-multi-innermode))

(use-package restclient
  :commands
  (restclient-mode)
  :mode (("\\.http\\'" . restclient-mode)
         ("\\.rest\\'" . restclient-mode))
  :config
  (setq outline-regexp "#[*\f]+")
  :hook
  (restclient-mode . company-mode)
  :custom
  (restclient-same-buffer-response t))

(provide 'module-http)
;;; module-http.el ends here

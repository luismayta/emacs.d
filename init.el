;;; init.el --- Start of the Emacs initialisation process.

;;; code:
(package-initialize)

;; Increase the GC threshold as soon as possible.
(setq gc-cons-threshold 50000000)

(defconst project-version         "1.4.0" "Version.")
(defconst emacs-min-version   "24.4" "Minimal version of Emacs.")

(if (not (version<= emacs-min-version emacs-version))
  (error (concat "Your version of Emacs (%s) is too old. "
           "requires Emacs version %s or above.")
    emacs-version emacs-min-version)
  (load-file (concat (file-name-directory load-file-name)
               "core/core-vars.el"))
  (load-file (concat (file-name-directory load-file-name)
               "core/core-load-paths.el"))
  (require 'core-emacs)
  (emacs/init))

(provide 'init)
;;; init.el ends here
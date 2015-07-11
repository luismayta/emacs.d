;; Functions

(defun bury-compile-buffer-if-successful (buffer string)
  "Bury a compilation buffer if succeeded without warnings"
  (if (and
        (string-match "compilation" (buffer-name buffer))
        (string-match "finished" string)
        (not
          (with-current-buffer buffer
            (search-forward "warning" nil t))))
    (run-with-timer 1 nil
      (lambda (buf)
        (bury-buffer buf)
        (switch-to-prev-buffer (get-buffer-window buf) 'kill))
      buffer)))

(defun hook-save-buffer ()
  "load whitespace-cleanup before save-buffer"
  (whitespace-cleanup)
  )

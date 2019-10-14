;;; module-fonts.el --- setup fonts.

(require 'core-vars)

(when (window-system)
  (set-language-environment "UTF-8")
  (set-default-coding-systems 'utf-8)
  (set-frame-font core/fixed-font-name))

(set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol")

(use-package
  dash
  :ensure t)

(defun my-correct-symbol-bounds (pretty-alist)
  "Prepend a TAB character to each symbol in this alist,
    this way compose-region called by prettify-symbols-mode
    will use the correct width of the symbols
    instead of the width measured by char-width."
  (mapcar (lambda (el)
            (setcdr el (string ?\t (cdr el)))
            el)
    pretty-alist))

(defun my-ligature-list (ligatures codepoint-start)
  "Create an alist of strings to replace with
    codepoints starting from codepoint-start."
  (let ((codepoints (-iterate '1+ codepoint-start (length ligatures))))
    (-zip-pair ligatures codepoints)))

(defun my-set-fira-code-ligatures ()
	"Add hasklig ligatures for use with prettify-symbols-mode."
	(setq prettify-symbols-alist
	  (append my-fira-code-ligatures prettify-symbols-alist))
	(prettify-symbols-mode))

(setq my-fira-code-ligatures
	(let* ((ligs '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\"
                  "{-" "[]" "::" ":::" ":=" "!!" "!=" "!==" "-}"
                  "--" "---" "-->" "->" "->>" "-<" "-<<" "-~"
                  "#{" "#[" "##" "###" "####" "#(" "#?" "#_" "#_("
                  ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*"
                                                                  "/**" "/=" "/==" "/>" "//" "///" "&&" "||" "||="
                                                                  "|=" "|>" "^=" "$>" "++" "+++" "+>" "=:=" "=="
                                                                  "===" "==>" "=>" "=>>" "<=" "=<<" "=/=" ">-" ">="
                                                                  ">=>" ">>" ">>-" ">>=" ">>>" "<*" "<*>" "<|" "<|>"
                                                                  "<$" "<$>" "<!--" "<-" "<--" "<->" "<+" "<+>" "<="
                                                                  "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<" "<~"
                                                                  "<~~" "</" "</>" "~@" "~-" "~=" "~>" "~~" "~~>" "%%"
                                                                  "x" ":" "+" "+" "*")))
    (my-correct-symbol-bounds (my-ligature-list ligs #Xe100))))

(add-hook 'prog-mode-hook 'my-set-fira-code-ligatures)

(provide 'module-fonts)
;;; module-fonts.el ends here

;; Install Packages
(bundle 'git-gutter+ nil)
(bundle 'git-gutter-fringe+ nil)

(require 'git-gutter+)
(require 'git-gutter-fringe+)

(global-git-gutter+-mode)
(git-gutter-fr+-minimal)

(setq git-gutter+-modified-sign "  ") ;; two space
(setq git-gutter+-added-sign "++")    ;; multiple character is OK
(setq git-gutter+-deleted-sign "--")

(set-face-background 'git-gutter+-modified "purple") ;; background color
(set-face-foreground 'git-gutter+-added "green")
(set-face-foreground 'git-gutter+-deleted "red")

(setq git-gutter+-separator-sign "|")
(set-face-foreground 'git-gutter+-separator "yellow")

(setq git-gutter+-hide-gutter t)

(provide 'git-gutter-plus-settings)

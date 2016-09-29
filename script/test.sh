#!/usr/bin/env bash
# -*- coding: utf-8 -*-

[ -r "script/bootstrap.sh" ] && source "script/bootstrap.sh"

cat <<EOF

--------------------------
 Test Install
--------------------------

EOF

"$ROOT/install.sh"

ret="0"
if [ ! -e "$HOME/.emacs.d/.git" ]; then
    ret="1"
    error "Error in Install"
else
    success "Yeah Install Done"
fi

cat <<EOF

--------------------------
 Test Emacs
--------------------------

EOF

if [ -n "$TRAVIS" ]; then
    # Make it look like this is ~/.emacs.d (needed for Emacs 24.4, at least)
    export HOME=$PWD/..
    ln -s emacs.d ../.emacs.d
fi

echo "Attempting startup..."

${EMACS:=emacs} -nw --batch \
                --eval '(let ((debug-on-error t)
                              (url-show-status nil)
                              (user-emacs-directory default-directory)
                              (user-init-file (expand-file-name "init.el"))
                              (load-path (delq default-directory load-path)))
                           (load-file user-init-file)
                           (run-hooks (quote after-init-hook)))'

cat <<EOF

--------------------------
 Startup successful
--------------------------

EOF

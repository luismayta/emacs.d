#!/usr/bin/env bash

############################  SETUP PARAMETERS
APP_NAME='emacs.d'
APP_NAME_PATH='.emacs.d'
GIT_URI='https://github.com/luismayta/emacs.d.git'
GIT_BRANCH='master'
DEBUG_MODE='0'
PATH_REPO="$HOME/$APP_NAME"
PATH_BACKUP="$HOME/backup"

msg() {
    printf '%b\n' "$1" >&2
}

success() {
    if [ "$ret" -eq '0' ]; then
        msg "\e[32m[✔]\e[0m ${1}${2}"
    fi
}

error() {
    msg "\e[31m[✘]\e[0m ${1}${2}"
    exit 1
}

debug() {
    if [ "$DEBUG_MODE" -eq '1' ] && [ "$ret" -gt '1' ]; then
      msg "An error occured in function \"${FUNCNAME[$i+1]}\" on line ${BASH_LINENO[$i+1]}, we're sorry for that."
    fi
}

############################  BASIC SETUP TOOLS
program_exists() {
    local message="To install $APP_NAME you first need to install $1"
    local ret='0'
    type $1 >/dev/null 2>&1 || { local ret='1'; }

    # throw error on non-zero return value
    if [ ! "$ret" -eq '0' ]; then
        error "$2"
   fi
}

clone_repo() {
    if [ ! -e "$PATH_REPO/.git" ]; then
        git clone --recursive -b "$GIT_BRANCH" "$GIT_URI" "$PATH_REPO"
        ret="$?"
        success "$1"
        debug
    else
        msg "The application is installed, please remove the directory $PATH_REPO"
        exit 1
    fi
}

thanks() {
cat <<EOF

---------------------------
Thanks for installing Emacs
---------------------------

EOF

    msg "© `date +%Y` $APP_NAME"
}

do_it() {
    for app in {emacs,git}; do
        program_exists "$app"
    done
    unset app
    clone_repo      "Successfully cloned $APP_NAME"
    thanks
}

do_it

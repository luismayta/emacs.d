#!/usr/bin/env bash
# -*- coding: utf-8 -*-

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;36m"
NORMAL="\033[0m"

EMACS_REPO_HTTPS="https://github.com/luismayta/emacs.d.git"
EMACS_REPO_BRANCH="master"
EMACS_ROOT_PATH="${HOME}/.emacs.d"
EMACS_APP_NAME='emacs.d'
EMASC_MESSAGES_BREW_NOT_FOUND="Install brew for next also use github.com/luismayta/zsh-brew"

message_error() {
    printf "${RED}%s${NORMAL}\n" "[ERROR]: ${1}"
    exit 1
}

message_info() {
    printf "${BLUE}%s${NORMAL}\n" "[INFO]: ${1}"
}

message_warning() {
    printf "${YELLOW}%s${NORMAL}\n" "[WARNING]: ${1}"
}

message_success() {
    printf "${GREEN}%s${NORMAL}\n" "🍺️ [SUCCESS]: ${1}"
}

emacs::lua::install() {
    if ! type -p brew > /dev/null; then
        message_warning "${EMASC_MESSAGES_BREW_NOT_FOUND}"
        return
    fi

    brew install lua
}

emacs::luarocks::install() {
    if ! type -p brew > /dev/null; then
        message_warning "${EMASC_MESSAGES_BREW_NOT_FOUND}"
        return
    fi

    if ! type -p luarocks > /dev/null; then
        brew install luarocks
        emacs::luarocks::dependences::install
    fi
}

emacs::luarocks::dependences::install() {
    hash luarocks >/dev/null 2>&1 || {
        luarocks install luacheck
    }
}

emacs::repository::clone() {
    if [ -d "${EMACS_ROOT_PATH}/.git" ]; then
        message_info "The application is installed, please remove the directory ${EMACS_APP_NAME}"
        return 1
    fi
    git clone --recursive -b "${EMACS_REPO_BRANCH}" "${EMACS_REPO_HTTPS}" "${EMACS_ROOT_PATH}"
    message_success "Clone success"
}

emacs::install::dependences() {
    if ! type -p brew > /dev/null; then
        message_warning "${EMASC_MESSAGES_BREW_NOT_FOUND}"
        return
    fi

    hash git >/dev/null 2>&1 || {
        brew install git
    }

    hash curl >/dev/null 2>&1 || {
        brew install curl
    }

    hash wget >/dev/null 2>&1 || {
        brew install wget
    }

    hash hg >/dev/null 2>&1 || {
        brew install hg
    }

    hash the_silver_searcher >/dev/null 2>&1 || {
        brew install the_silver_searcher
    }

    hash editorconfig >/dev/null 2>&1 || {
        brew install editorconfig
    }

    hash aspell >/dev/null 2>&1 || {
        brew install aspell --with-lang-en
    }

    hash ispell >/dev/null 2>&1 || {
        brew install ispell
    }

    hash ctags >/dev/null 2>&1 || {
        # for the GNU global tag system. Used by ggtags.
        brew install --HEAD ctags
        brew install global --with-ctags
    }

    hash graphviz >/dev/null 2>&1 || {
        # program used for plantuml
        brew install graphviz
    }

    hash markdown >/dev/null 2>&1 || {
        brew install markdown
    }

    emacs::lua::install
    emacs::luarocks::install
}

emmacs::greeting::thanks() {
    cat <<EOF

---------------------------
Thanks for installing Emacs
---------------------------

EOF

    msg "© $(date +%Y) ${EMACS_APP_NAME}"
}

initialize() {
    emacs::install::dependences
    emacs::repository::clone
    emacs::greeting::thanks
}

initialize

#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# load source files externals
if [ -e "$HOME/.pyenv" ]; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

[ -r "$HOME/.gvm/scripts/gvm" ] && source "$HOME/.gvm/scripts/gvm"

PROJECT_NAME=emacs
PYTHON_VERSION=2.7.9
PYENV_NAME="${PROJECT_NAME}"

GVM_NAME="${PROJECT_NAME}"
GVM_PATHS_NAME="{src, pkg, bin}"

# Vars Dir
export ROOT_DIR="`pwd`"
export RESOURCES_DIR="$ROOT_DIR/resources"
export SOURCE_DIR="$ROOT_DIR"
export STATIC_DIR="$SOURCE_DIR/static/"

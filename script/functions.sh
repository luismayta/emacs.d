#!/usr/bin/env bash
# -*- coding: utf-8 -*-

[ -r "script/bootstrap.sh" ] && source "script/bootstrap.sh"

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

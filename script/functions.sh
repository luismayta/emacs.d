#!/usr/bin/env bash
# -*- coding: utf-8 -*-

msg() {
    printf '%b\n' "$1" >&2
}

success() {
    msg "\e[32m[✔]\e[0m ${1}${2}"
}

error() {
    msg "\e[31m[✘]\e[0m ${1}${2}"
    exit 1
}

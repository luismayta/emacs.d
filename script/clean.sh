#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# shellcheck source=/dev/null
[ -r "script/bootstrap.sh" ] && source "script/bootstrap.sh"

# Files

{
    rm -rf ido.last
    rm -rf ac-comphist.dat
} >> /dev/null 2>&1

# Directory

{
    rm -rf el-get/
    rm -rf elpa/
    rm -rf auto-save-list/
    rm -rf var/
} >> /dev/null 2>&1

{
    rm -rf -- **/**/*__pycache__
    rm -rf -- **/**/*.pyc
    rm -rf -- **/**/*.swp
} >> /dev/null 2>&1

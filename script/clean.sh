#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# shellcheck source=/dev/null
[ -r "script/bootstrap.sh" ] && source "script/bootstrap.sh"

# Clean
{
    rm -rf ido.last;
    rm -rf ac-comphist.dat;
# Directory
    rm -rf el-get/
    rm -rf elpa/
    rm -rf auto-save-list/
    rm -rf var/
# python
    rm -rf -- **/**/*_pycache__
    rm -rf -- **/**/*.pyc
    rm -rf -- **/**/*.swp
} >> /dev/null 2>&1

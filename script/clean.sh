#!/usr/bin/env bash
# -*- coding: utf-8 -*-

[ -r "script/bootstrap.sh" ] && source "script/bootstrap.sh"

find $ROOT_DIR/ -name "*.pyc" -delete
find $ROOT_DIR/ -name "*.swp" -delete
find $ROOT_DIR/ -name "__pycache__" -delete

# Directory
rm -rf el-get/
rm -rf elpa/
rm -rf auto-save-list/
# Files

rm -rf ido.last
rm -rf ac-comphist.dat

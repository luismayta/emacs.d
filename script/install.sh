#!/usr/bin/env bash
# -*- coding: utf-8 -*-

[ -r "script/bootstrap.sh" ] && source "script/bootstrap.sh"

pip install -r "${REQUIREMENTS_DIR}/dev.txt"

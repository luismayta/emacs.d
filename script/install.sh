#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# shellcheck source=/dev/null
[ -r "script/bootstrap.sh" ] && source "script/bootstrap.sh"

pyenv activate "${PYENV_NAME}" >> /dev/null 2>&1 || echo 'Oh Yeah!!'
pip install -r "${REQUIREMENTS_DIR}/dev.txt"

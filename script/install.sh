#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# shellcheck source=/dev/null
[ -r "script/bootstrap.sh" ] && source "script/bootstrap.sh"

if [ "$1" == "" ]; then
    pip install -r requirements.txt
elif [ "$1" == "dev" ]; then
    pip install -r "${REQUIREMENTS_DIR}/"dev.txt
elif [ "$1" == "stage" ]; then
    pip install -r "${REQUIREMENTS_DIR}/"stage.txt
elif [ "$1" == "test" ]; then
    pip install -r "${REQUIREMENTS_DIR}/"test.txt
elif [ "$1" == "prod" ]; then
    pip install -r requirements.txt
fi

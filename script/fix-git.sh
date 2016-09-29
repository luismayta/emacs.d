#!/usr/bin/env bash
# -*- coding: utf-8 -*-

[ -r "script/bootstrap.sh" ] && source "script/bootstrap.sh"

git filter-branch --force --commit-filter '
    if [ "$GIT_COMMITTER_NAME" = "itachi uchiha" ];
    then
        GIT_COMMITTER_NAME="@slovacus";
        GIT_AUTHOR_NAME="@slovacus";
        GIT_COMMITTER_EMAIL="slovacus@gmail.com";
        GIT_AUTHOR_EMAIL="slovacus@gmail.com";
        git commit-tree "$@";
    else
        git commit-tree "$@";
    fi' HEAD

git filter-branch --force --commit-filter '
    if [ "$GIT_COMMITTER_NAME" = "$GIT_AUTHOR_NAME" ];
    then
        GIT_COMMITTER_NAME="@slovacus";
        GIT_AUTHOR_NAME="@slovacus";
        GIT_COMMITTER_EMAIL="slovacus@gmail.com";
        GIT_AUTHOR_EMAIL="slovacus@gmail.com";
        git commit-tree "$@";
    else
        git commit-tree "$@";
    fi' HEAD

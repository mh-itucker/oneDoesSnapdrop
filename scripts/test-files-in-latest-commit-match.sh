#!/usr/bin/env bash

git diff-tree --no-commit-id --name-only -r HEAD~1 | grep $1

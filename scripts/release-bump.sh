#!/usr/bin/env bash

set -exu pipefail

do_release() {
  echo

  yarn run lerna publish --skip-npm --conventional-commits --yes
  git push --follow-tags
}

do_reset() {
  unset -f do_release do_reset
}

trap do_reset INT TERM EXIT
do_release
trap - INT TERM EXIT

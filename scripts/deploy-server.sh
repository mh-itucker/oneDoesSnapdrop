#!/usr/bin/env bash

set -exu pipefail

if [ -z "$NOW_TOKEN"  ]; then
  echo "missing NOW_TOKEN variable"
  exit 1
fi


hash now 2>/dev/null || {
  echo "\"now\" is not found. Let install it ;)"

  npm i -g now
}

#

list_servers() {
  {
    now -t $NOW_TOKEN ls @onedoes/snapdrop-server \
    | awk '{print $1}' \
    | grep onedoessnapdrop-server

  } || exit 0 # HACK don't fail when the
}

do_remove_existing_servers() {
  local server_list
  server_list=$(list_servers)
  server_list=${server_list:=}

  for url in $server_list
  do
    now -t $NOW_TOKEN remove $url --yes
  done
}

do_deploy_new_instance() {
  cd packages/server
  now -t $NOW_TOKEN --public -e PORT=443
}

do_deploy() {
  echo

  do_remove_existing_servers

  do_deploy_new_instance

  echo
}

do_reset() {
  echo "resest"
  unset -f do_deploy do_deploy_new_instance do_remove_existing_servers do_reset
}

trap do_reset INT TERM EXIT
do_deploy
do_reset
trap - INT TERM EXIT

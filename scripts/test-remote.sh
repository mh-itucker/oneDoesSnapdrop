#!/usr/bin/env bash

set -exu pipefail

if [ -z "$BROWSER" ]; then
  echo "missing BROWSER variable"
  exit 1
fi

cd packages/pwa

yarn run wct --plugin sauce

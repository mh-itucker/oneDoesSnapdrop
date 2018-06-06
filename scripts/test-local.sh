#!/usr/bin/env bash

set -exu pipefail

cd packages/pwa

yarn run wct --local firefox

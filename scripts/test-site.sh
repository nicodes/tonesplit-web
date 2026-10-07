#!/usr/bin/env bash
set -euo pipefail
test -s dist/index.html
if find dist -name '*.js' | grep -q .; then
  echo "::error::dist contains JavaScript -- this site is meant to ship none"
  find dist -name '*.js'
  exit 1
fi

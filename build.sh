#!/bin/bash

set -e
set -u
set -o pipefail

cd "$(dirname "$0")"

exec docker build -t shellcheck-circleci .

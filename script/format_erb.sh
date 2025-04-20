#!/bin/bash
set -eo pipefail
files="$*"

echo "Running HTML Beautifier..."
bundle exec htmlbeautifier $files

echo "Running ERB Lint..."
bundle exec erblint --autocorrect $files
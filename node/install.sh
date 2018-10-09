#!/usr/bin/env bash

set -e

# =============================================================================
# Require DOTFILES
# =============================================================================

if [ -z "$DOTFILES" ]; then
  echo ".dotfiles repo is not set up"
  exit 1
fi
source "${DOTFILES}/shell/helpers.bash"

# =============================================================================
# Main
# =============================================================================

# @TODO check for nvm node
__install() {
  dko::status "Installing latest NPM"
  npm install --global --production npm@latest

  # loop through packages.txt file and install each one
  while read -r package; do
    if [ "$package" != "yo" ] \
      && [ "$package" != "eslint" ]; then
      # npm ls --global --parseable --depth=0 "$package" ||
      npm install --global --production "$package"
    fi
  done < "${DOTFILES}/node/packages.txt"
}

__install "$@"

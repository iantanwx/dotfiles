#!/usr/bin/env bash

set -eu

# ============================================================================
# taps
# ============================================================================
# brew services launchctl manager -- no formulae
brew tap homebrew/services

# ============================================================================
# Meta
# ============================================================================

brew update

# ============================================================================
# compilers, tools, and libs
# ============================================================================

brew install automake cmake
brew install coreutils findutils moreutils
brew install libtool
brew install pkg-config

# ============================================================================
# general
# ============================================================================

brew install neofetch # prefer over archey

# ============================================================================
# filesystem
# ============================================================================

brew install ack the_silver_searcher ripgrep
brew install fzf
brew install tree

# ============================================================================
# operations
# ============================================================================

# OpenSSL for some programs, but prefer libressl where possible
brew install openssl

brew install htop --with-ncurses

brew install ssh-copy-id
brew install multitail

brew install wget

# ============================================================================
# pretty print and processor
# ============================================================================

brew install icdiff
brew install jq
brew install jsonpp

# ============================================================================
# programming
# ============================================================================

brew install --HEAD universal-ctags/universal-ctags/universal-ctags

brew install cloc

# used by fzf grepper preview
brew install highlight

# ----------------------------------------------------------------------------
# git
# ----------------------------------------------------------------------------

brew install diff-so-fancy
brew install git --without-completions
brew install git-extras
brew install hub tig

# ============================================================================
# shells
# ============================================================================

# bash 4 shell
brew install bash
# bash 4 completion
brew install homebrew/versions/bash-completion2
brew install bats shellcheck
brew install tmux

# ============================================================================
# Finish up
# ============================================================================

brew linkapps


#!/usr/bin/env bash
#
# Tap and install caskroom apps
#

set -eu

brew tap caskroom/cask
brew tap caskroom/versions

brew update

# ==============================================================================
# bettertouchtool
# ==============================================================================

brew cask install bettertouchtool

# ==============================================================================

brew cask install skype

# ============================================================================
# Virtualization
# ============================================================================

brew cask install vagrant vagrant-manager
brew cask install virtualbox virtualbox-extension-pack

# ============================================================================

brew cask install vlc


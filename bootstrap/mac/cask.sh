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
echo "License in SpiderOak Hive"

# ==============================================================================

brew cask install skype
brew cask install spotify spotifree

# ==============================================================================
# Transmit
# ==============================================================================

# Install from mac app store instead
#brew cask install transmit
# echo "License in email"
# echo "Favorites in SpiderOak Hive"

# ============================================================================
# Virtualization
# ============================================================================

brew cask install vagrant vagrant-manager
brew cask install virtualbox virtualbox-extension-pack

# ============================================================================

brew cask install vlc
brew cask install vnc-viewer


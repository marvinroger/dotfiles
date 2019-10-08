#!/usr/bin/env bash

# Inspired by https://mths.be/macos

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# Dock                                                                        #
###############################################################################

# Disable magnification
defaults write com.apple.dock tilesize -bool false

# Set tile size
defaults write com.apple.dock tilesize -int 64

# Set dock position
defaults write com.apple.dock orientation -string "bottom"

# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Enable launch animation
defaults write com.apple.dock launchanim -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.Dock autohide-delay -float 0

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

########
# Bar
########

defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# TODO... enhance, before buying a new mac!

for app in "Dock" \
  "Finder"; do
  killall "${app}" &> /dev/null
done
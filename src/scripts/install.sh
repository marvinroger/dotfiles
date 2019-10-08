#!/usr/bin/env bash

platform="unknown"
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  platform="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  platform="macos"
fi

if [ "$platform" != "macos" ]; then
  echo "only macOS is supported"
  exit 1
fi

is_xcode_cli_installed () {
  if type xcode-select >&- && xpath=$( xcode-select --print-path ) &&
  test -d "${xpath}" && test -x "${xpath}" ; then
    return 0
  else
    return 1
  fi
}

is_homebrew_installed () {
  if command -v brew; then
    return 0
  else
    return 1
  fi
}


if ! is_xcode_cli_installed; then
  xcode-select --install
fi

if ! is_homebrew_installed; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install all needed casks
brew cask install google-chrome
brew cask install visual-studio-code
brew cask install 1password
brew cask install iterm2
brew cask install balenaetcher
brew cask install slack
brew cask install spotify
brew cask install the-unarchiver
brew cask install keybase

# Install all needed brews
brew install mas
brew install fish
brew install starship
brew install shellcheck

# Install all needed app store apps
mas install 937984704 # amphetamine
mas install 441258766 # magnet
mas install 462054704 # word
mas install 462062816 # powerpoint
mas install 462058435 # excel

# Change shell to fish
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s `which fish`

# Set macOS config
./macos.sh

# Usage: update

function update --description "Update homebrew programs"
  brew update
  brew upgrade
  brew cask upgrade
  brew cleanup
end

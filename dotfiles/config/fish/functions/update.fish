# Usage: update

function update --description "Update programs"
  pretty_log info "Starting homebrew update..."
  brew update
  pretty_log info "Starting homebrew upgrade..."
  brew upgrade
  pretty_log info "Starting homebrew cask upgrade..."
  brew cask upgrade
  pretty_log info "Starting homebrew cleanup..."
  brew cleanup
  pretty_log info "Starting Mac App Store upgrade..."
  mas upgrade
  pretty_log success "Done."
end

# Usage: update

function update --description "Update homebrew programs"
  pretty_log info "Starting update..."
  brew update
  pretty_log info "Starting upgrade..."
  brew upgrade
  pretty_log info "Starting cask upgrade..."
  brew cask upgrade
  pretty_log info "Starting cleanup..."
  brew cleanup
  pretty_log success "Done."
end

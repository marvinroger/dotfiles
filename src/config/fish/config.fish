# Install fisher if not installed, and restore deps
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# Source ~/.profile if it exists
if test -e ~/.profile
    bass source ~/.profile
end

# Init starship
eval (starship init fish)

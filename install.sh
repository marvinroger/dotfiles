#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
LOCAL_BIN_DIR="$HOME/.local/bin"

codespaces_only() {
  if [ -z ${CODESPACES+x} ]; then
    echo "This is meant to be ran on GitHub Codespaces" >&2
    exit 1
  fi
}

install_chezmoi() {
  if [ ! "$(command -v chezmoi)" ]; then
    if [ "$(command -v curl)" ]; then
      sh -c "$(curl -fsLS https://git.io/chezmoi)" -- -b "$LOCAL_BIN_DIR"
    elif [ "$(command -v wget)" ]; then
      sh -c "$(wget -qO- https://git.io/chezmoi)" -- -b "$LOCAL_BIN_DIR"
    else
      echo "To install chezmoi, you must have curl or wget installed." >&2
      exit 1
    fi
  fi
}

populate_age_key() {
  if [ -z ${AGE_KEY+x} ]; then
    echo "AGE_KEY is not set. Make sure that the current repository has access: https://github.com/settings/codespaces/secrets/AGE_KEY/edit" >&2
    exit 1
  fi

  echo "$AGE_KEY" > "$HOME/key.txt"
}

init_chezmoi() {
  exec chezmoi init --apply --source "$SCRIPT_DIR"
}

codespaces_only
install_chezmoi
populate_age_key
init_chezmoi

# Usage: time_machine_exclude_deps

function time_machine_exclude_deps --description "Exclude dependencies from Time Machine backups"
  pretty_log info "Excluding download dir"
  tmutil addexclusion ~/Downloads
  pretty_log info "Excluding node_modules"
  find ~/Dev -type d -maxdepth 4 -name 'node_modules' -prune -exec tmutil addexclusion {} \;
end

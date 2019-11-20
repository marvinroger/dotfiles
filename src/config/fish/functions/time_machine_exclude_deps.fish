# Usage: time_machine_exclude_deps

function time_machine_exclude_deps --description "Exclude dependencies from Time Machine backups"
  pretty_log info "Excluding node_modules"
  find (pwd) -type d -maxdepth 4 -name 'node_modules' -prune -exec tmutil addexclusion {} \;
end

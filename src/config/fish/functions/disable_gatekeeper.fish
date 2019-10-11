# Usage: disable_gatekeeper <app>

function disable_gatekeeper --description "Disable Gatekeeper for an app"
  set --local argc (count $argv)
  if test $argc -eq 1
    sudo xattr -rd com.apple.quarantine $argv[1]
  else
    pretty_log error "Please give the app argument."
  end
end

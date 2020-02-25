# Usage: pretty_log <info|success|warning|error> <message>

function pretty_log --description "Pretty log messages"
  set --local argc (count $argv)
  set --local prefix ''
  if test $argc -eq 2
    switch $argv[1]
      case 'info'
        set_color --bold blue
        printf 'info '
      case 'success'
        set_color --bold green
        printf 'success '
      case 'warning'
        set_color --bold yellow
        printf 'warning '
      case 'error'
        set_color --bold red
        printf 'error '
    end

    set_color normal
    echo "$argv[2]"
  else
    pretty_log error "Please give the log level and message."
  end
end

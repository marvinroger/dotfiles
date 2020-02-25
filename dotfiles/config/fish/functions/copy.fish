# Usage: copy <file>|<variable>

function copy --description "Copy the content of a text file or variable to clipboard"
  set --local argc (count $argv)
  if test $argc -eq 1
    switch (uname)
      case 'Linux'
        if test -e $argv[1]
          xclip -selection clip < $argv[1]
        else
          printf $argv[1] | xclip -selection clip
        end
      case 'Darwin'
        if test -e $argv[1]
          pbcopy < $argv[1]
        else
          printf $argv[1] | pbcopy
        end
    end
  else
    pretty_log error "Please give the file or variable argument."
  end
end

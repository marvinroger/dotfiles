# Usage: loop <times> <command>

function loop --description "Repeat a command a number of times"
  for i in (seq 1 $argv[1])
    eval $argv[2..-1]
  end
end

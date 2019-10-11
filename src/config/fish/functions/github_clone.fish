# Usage: github_clone <project>

function github_clone --description "Clone a Git project from GitHub"
  set --local argc (count $argv)
  if test $argc -eq 1
    pushd ~/Dev/projects/
    git clone "git@github.com:$argv[1].git"
    popd
  else
    pretty_log error "Please give the project argument."
  end
end

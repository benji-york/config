# Defined in - @ line 1
function gg --wraps='git grep -n --recurse-submodules' --description 'Grep a Git repo and submodules'
  git grep -n --recurse-submodules $argv;
end

# Defined in - @ line 1
function make --wraps='gmake' --description 'Run newer GNU Make instead of system Make'
  gmake $argv;
end

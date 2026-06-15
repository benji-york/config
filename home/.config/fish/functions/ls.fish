# Defined in - @ line 1
function ls --wraps='ls' --description 'an ls that calls gls if available'
  which gls > /dev/null && gls --color=auto $argv --hyperlink=auto || /bin/ls --color=auto $argv
end

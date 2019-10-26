# shell/ruby.bash
#
# Uses vars from shell/vars and shell/os
#
export DKO_SOURCE="${DKO_SOURCE} -> shell/ruby.bash {"

# set up rbenv
eval "$(rbenv init -)"

export DKO_SOURCE="${DKO_SOURCE} }"
# vim: ft=sh :

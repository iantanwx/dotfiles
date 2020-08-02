# shell/ruby.bash
#
# Uses vars from shell/vars and shell/os
#
export DKO_SOURCE="${DKO_SOURCE} -> shell/ruby.bash {"

# add rbenv to $PATH
export PATH="${HOME}/.rbenv/bin:${PATH}"

# set up rbenv
if dko::has "rbenv"; then
  eval "$(rbenv init -)"
fi

export DKO_SOURCE="${DKO_SOURCE} }"
# vim: ft=sh :

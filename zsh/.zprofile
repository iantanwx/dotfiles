# Sourced in login shells only
# Remember on OSX every shell is a login shell
# Sourced before .zshrc

export DKO_SOURCE="${DKO_SOURCE} -> zsh/.zprofile"

[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export PATH="$HOME/.cargo/bin:$PATH"

export DKO_SOURCE="${DKO_SOURCE} -> shell/java.bash {"

# ==============================================================================
# java
# ==============================================================================
export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && dko::source "${HOME}/.sdkman/bin/sdkman-init.sh"

export DKO_SOURCE="${DKO_SOURCE} }"

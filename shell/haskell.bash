export DKO_SOURCE="${DKO_SOURCE} -> shell/haskell.bash {"

# ==============================================================================
# Cabal
# ==============================================================================
export PATH="${HOME}/.cabal/bin:${PATH}"

# ==============================================================================
# GHCUP - ust always be after .cabal/bin!
# ==============================================================================
export PATH="${HOME}/.ghcup/bin:${PATH}"

[[ -s "${HOME}/.ghcup/env" ]] && dko::source "${HOME}/.ghcup/env"

export DKO_SOURCE="${DKO_SOURCE} }"

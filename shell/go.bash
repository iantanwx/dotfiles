# shell/go.bash
export DKO_SOURCE="${DKO_SOURCE} -> shell/go.bash {"

# ==============================================================================
# go
# ==============================================================================
export PATH="/usr/local/go/bin:${PATH}"

# go
# used in shell/paths
if [ -d "${HOME}/Development/go" ]; then
  export GOPATH="${HOME}/Development/go"
else
  export GOPATH="${HOME}/Projects/go"
fi

# go -- prefer go binaries over composer; GOPATH is in shell/vars.bash
export PATH="${GOPATH}/bin:${PATH}"

# ==============================================================================

export DKO_SOURCE="${DKO_SOURCE} }"

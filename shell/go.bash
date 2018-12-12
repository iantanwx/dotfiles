# shell/go.bash
export DKO_SOURCE="${DKO_SOURCE} -> shell/go.bash {"

# ==============================================================================
# go
# ==============================================================================

# GOPATH
if [ -d "${HOME}/Development/go" ]; then
  export GOPATH="${HOME}/Development/go"
else
  export GOPATH="${HOME}/Projects/go"
fi

# GOROOT
export GOROOT="$(brew --prefix go@1.9)/libexec"

# go -- prefer go binaries over composer; GOPATH is in shell/vars.bash
export PATH="$(brew --prefix go@1.9)/bin:${PATH}"
export PATH="${GOPATH}/bin:${GOROOT}/bin:${PATH}"

# ==============================================================================

export DKO_SOURCE="${DKO_SOURCE} }"

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
if [[ "$OSTYPE" == "darwin" ]]; then
  export GOROOT="$(brew --prefix go@1.9)/libexec"
fi

# go -- prefer go binaries over composer; GOPATH is in shell/vars.bash
if [[ "$OSTYPE" == "darwin" ]]; then
  export PATH="$(brew --prefix go@1.9)/bin:${PATH}"
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
  export PATH="${GOPATH}/bin:${GOROOT}/bin:${PATH}"
fi

# ==============================================================================

export DKO_SOURCE="${DKO_SOURCE} }"

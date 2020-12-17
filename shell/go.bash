# shell/go.bash
export DKO_SOURCE="${DKO_SOURCE} -> shell/go.bash {"

# ==============================================================================
# go
# ==============================================================================
dko::source "${HOME}/.gvm/scripts/gvm"

# GOPATH
if [ -d "${HOME}/Development/go" ]; then
  export GOPATH="${HOME}/Development/go"
else
  export GOPATH="${HOME}/Projects/go"
fi

# bytedance-specific
export GOPRIVATE="*.byted.org,*.everphoto.cn"
export GOSUMDB="sum.golang.google.cn"
export GOPROXY="https://goproxy.byted.org|https://goproxy.cn|direct"

# Ensure that $GOPATH/bin is on PATH
export PATH="${GOPATH}/bin:${PATH}"

export DKO_SOURCE="${DKO_SOURCE} }"

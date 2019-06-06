export DKO_SOURCE="${DKO_SOURCE} -> shell/llvm.bash {"

export LDFLAGS="-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include -I/usr/local/opt/llvm/include/c++/v1/"
export CC="clang"
export CXX="${CC}++"

export DKO_SOURCE="${DKO_SOURCE} }"

# shell/vars.bash
#
# Sourced by .zshenv or .bashrc
#
# Some things from env are here since macOS/OS X doesn't start new env for each
# term and we may need to reset the values

export DKO_SOURCE="${DKO_SOURCE} -> shell/vars.bash {"
# Sourced only once, may have been sourced in linux/.xprofile already
source "${HOME}/.dotfiles/shell/xdg.bash"

# ============================================================================
# Locale
# ============================================================================

export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

# ============================================================================
# Dotfile paths
# ============================================================================

export DOTFILES="${HOME}/.dotfiles"
export BASH_DOTFILES="${DOTFILES}/bash"
export VIM_DOTFILES="${DOTFILES}/vim"
export ZDOTDIR="${DOTFILES}/zsh"

# ============================================================================
# History -- except HISTFILE location is set by shell rc file
# ============================================================================

export SAVEHIST=1000
export HISTSIZE=1000
export HISTFILESIZE="$HISTSIZE"
export HISTCONTROL=ignoredups
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# ============================================================================
# program settings
# ============================================================================

# ----------------------------------------------------------------------------
# for rsync and cvs
# ----------------------------------------------------------------------------

export CVSIGNORE="${DOTFILES}/git/.gitignore"

# ----------------------------------------------------------------------------
# editor
# ----------------------------------------------------------------------------

export EDITOR="vim"
export VISUAL="gvim"
if [ -n "$SSH_CONNECTION" ] || [ -n "$TMUX" ]; then export VISUAL="vim"; fi

# ----------------------------------------------------------------------------
# pager
# ----------------------------------------------------------------------------

export PAGER="less"
export GIT_PAGER="$PAGER"

# ----------------------------------------------------------------------------
# others
# see after.bash for configurations that require access to these vars or
# functions like dko::has
# ----------------------------------------------------------------------------

# ack
export ACKRC="${DOTFILES}/ack/dot.ackrc"

# docker
export DOCKER_CONFIG="${XDG_CONFIG_HOME}/docker"

# homebrew
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1

# sdkman - sourced to ensure JAVA_HOME is set correctly for non-interactive shells
export _JAVA_AWT_WM_NONREPARENTING=1
# ensure that Java applications (i.e. IntelliJ) inherit GTK+ look and feel
# don't set this on macos
if [[ $OSTYPE == "linux"* ]]; then
  export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel ${_JAVA_OPTIONS}"
fi
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# less
# -F quit if one screen (default)
# -N line numbers
# -R raw control chars (default)
# -X don't clear screen on quit
# -e LESS option to quit at EOF
export LESS="-eFRX"
# disable less history
export LESSHISTFILE=-

# man
export MANWIDTH=88
export MANPAGER="$PAGER"

# mysql
export MYSQL_HISTFILE="${XDG_CACHE_HOME}/mysql_histfile"

# neovim
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

# readline
export INPUTRC="${DOTFILES}/shell/dot.inputrc"

# for shellcheck
export SHELLCHECK_OPTS="--exclude=SC1090,SC2148"

# travis cli
export TRAVIS_CONFIG_PATH="${XDG_CONFIG_HOME}/travis"

# vagrant
export VAGRANT_HOME="${XDG_CONFIG_HOME}/vagrant"

# weechat
export WEECHAT_HOME="${DOTFILES}/weechat"

# X11 - for starting via xinit or startx
export XINITRC="${DOTFILES}/linux/.xinitrc"
export XAPPLRESDIR="${DOTFILES}/linux"

# Wine
export WINEARCH=win32
export WINEPREFIX="${HOME}/.wine"

export DKO_SOURCE="${DKO_SOURCE} }"
# vim: ft=sh :

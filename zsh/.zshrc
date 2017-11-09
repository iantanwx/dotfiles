# .zshrc
#
# sourced only on interactive/TTY
# sourced on login after zprofile
# sourced when you type zsh
#

# ============================================================================
# Before
# ============================================================================

export DKO_SOURCE="${DKO_SOURCE} -> .zshrc {"
. "${DOTFILES}/shell/before.bash"

# ============================================================================
# Options
# In the order of `man zshoptions`
# ============================================================================

# Changing Directories
setopt AUTO_PUSHD                     # pushd instead of cd
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT                   # don't show stack after cd
setopt PUSHD_TO_HOME                  # go home if no d specified

# Completion
setopt AUTO_LIST                      # list completions
setopt AUTO_MENU                      # TABx2 to start a tab complete menu
setopt NO_COMPLETE_ALIASES            # don't expand aliases before completion
setopt LIST_PACKED                    # variable column widths

# Expansion and Globbing
setopt EXTENDED_GLOB                  # like ** for recursive dirs

# History
setopt APPEND_HISTORY                 # append instead of overwrite file
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE              # don't save in history if space prefixed
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY                    # verify when using history cmds/params

# Initialisation

# Input/Output
setopt ALIASES                        # autocomplete switches for aliases
setopt AUTO_PARAM_SLASH               # append slash if autocompleting a dir
setopt CORRECT

# Job Control
setopt CHECK_JOBS                     # prompt before exiting shell with bg job
setopt LONGLISTJOBS                   # display PID when suspending bg as well
setopt NO_HUP                         # don't kill bg processes

# Prompting

setopt PROMPT_SUBST                   # allow variables in prompt

# Scripts and Functions

# Shell Emulation
setopt INTERACTIVE_COMMENTS           # allow comments in shell

# Shell State

# Zle
setopt NO_BEEP
setopt VI

# ============================================================================
# fpath and manpath
# ============================================================================

# Completion paths
# fpath must be before compinit

# Brew provided
# Removed "${DKO_BREW_PREFIX}/share/zsh-completions", prefer zplugging upstream
if [ -d "${DKO_BREW_PREFIX}" ]; then
  # Autoload function paths, add tab completion paths, top precedence
  fpath=(
    "${DKO_BREW_PREFIX}/share/zsh/site-functions"
    $fpath
  )

  # ----------------------------------------
  # Prefer homebrew zsh's helpfiles
  # ----------------------------------------

  [ -d "${DKO_BREW_PREFIX}/share/zsh/helpfiles" ] && {
    # use homebrew bundled zsh helpfiles for online help
    # @see <https://github.com/Homebrew/homebrew/blob/master/Library/Formula/zsh.rb>
    unalias run-help
    autoload run-help
    HELPDIR="${DKO_BREW_PREFIX}/share/zsh/helpfiles"
  }
fi

# Mine, e.g. custom _composer #compdef
fpath=(
  "${ZDOTDIR}/fpath"
  $fpath
)

# dedupe paths
typeset -gU cdpath path fpath manpath

# set colors
BASE16_SHELL="$HOME/.dotfiles/base16/base16-material.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# ============================================================================
# Modules
# ============================================================================

# color complist
zmodload -i zsh/complist

# hooks -- used for prompt too
autoload -Uz add-zsh-hook

# prompt
autoload -Uz terminfo
autoload -Uz vcs_info

. "${ZDOTDIR}/prompt-vcs.zsh"
. "${ZDOTDIR}/prompt-vimode.zsh"
. "${ZDOTDIR}/prompt.zsh"
. "${ZDOTDIR}/title.zsh"

# ============================================================================
# Plugin settings (before)
# ============================================================================

# bookmarks plugin
export ZSH_BOOKMARKS="${HOME}/.local/zshbookmarks"

# knu/z
export _Z_CMD="j"
export _Z_DATA="${HOME}/.local/z"
[ ! -f "$_Z_DATA" ] && touch "$_Z_DATA"

# ============================================================================
# zplug
# ============================================================================

. "${ZDOTDIR}/zplugdoctor.zsh"
export ZPLUG_HOME="${XDG_DATA_HOME}/zplug"
# plugin definitions file -- don't set before zplug is installed
export ZPLUG_LOADFILE="${ZDOTDIR}/zplug.zsh"

readonly DKO_ZPLUG_INIT="${ZPLUG_HOME}/init.zsh"

# ----------------------------------------------------------------------------
# zplug - load cli
# ----------------------------------------------------------------------------

__load_zplug_init() {
  if [ -f "$DKO_ZPLUG_INIT" ]; then
    . "$DKO_ZPLUG_INIT"
    export DKO_SOURCE="${DKO_SOURCE} -> ${DKO_ZPLUG_INIT}"
    # self-managed zplug assumes ZPLUG_ROOT == ZPLUG_HOME and doesn't add this
    # path any more
    export PATH="${ZPLUG_HOME}/bin:${PATH}"
  else
    dko::warn "Did not find zplug/init.zsh"
  fi
}

# ----------------------------------------------------------------------------
# zplug - auto-install (new install)
# ----------------------------------------------------------------------------

if [ ! -f "$DKO_ZPLUG_INIT" ]; then
  dko::status "(Re)installing zplug"
  rm -rf "${ZPLUG_HOME}"
  git clone https://github.com/zplug/zplug.git "$ZPLUG_HOME" \
    && __load_zplug_init

else # Already installed, check if need to re-source for new shell
  # Note: ZPLUG_ROOT is manually unset in .zshenv ! This ensures plugins are
  # loaded for tmux and subshells (e.g. `exec $SHELL`)
  __load_zplug_init
fi

if ! zplug check; then
  dko::status "Installing zplug plugins"
  zplug install
fi

# ----------------------------------------------------------------------------
# zplug - define plugins
# ----------------------------------------------------------------------------

dko::has "zplug" && {
  export DKO_SOURCE="${DKO_SOURCE} -> zplug {"
  zplug load >/dev/null
  export DKO_SOURCE="${DKO_SOURCE} }"
}

# ============================================================================
# Plugin settings (after plugin loaded)
# ============================================================================

# zsh-autosuggestions -- clear the suggestion when entering completion select
# menu
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=("expand-or-complete")

# ============================================================================
# fzf
# ============================================================================

dko::source "${HOME}/.fzf.zsh" && export DKO_SOURCE="${DKO_SOURCE} -> fzf"

# ============================================================================
# Keybindings (after plugins since some are custom for fzf)
# ============================================================================

. "${ZDOTDIR}/keybindings.zsh"

# ============================================================================
# nocorrect aliases
# ============================================================================

alias cp="nocorrect cp"
alias mv="nocorrect mv"
alias rm="nocorrect rm"
alias mkdir="nocorrect mkdir"

# ============================================================================
# hooks
# ============================================================================

# Auto-detect .nvmrc and run nvm use
# Updated to only trigger nvm use if there's actually a different version
__auto_nvm_use() {
  local node_version="$(nvm version)"
  local nvmrc=$(nvm_find_nvmrc)
  local nvmrc_node_version="N/A"
  [ -n "$nvmrc" ] && nvmrc_node_version="$(nvm version "$(< $nvmrc)")"
  if [ "$nvmrc_node_version" != "N/A" ] && [ "$nvmrc_node_version" != "$node_version" ]; then
    nvm use
    return $?
  elif [ "$node_version" != "$(nvm version default)" ]; then
    nvm use default
    return $?
  fi
  #[[ -f ".nvmrc" && -r ".nvmrc" ]] && nvm use
}
# NVM loaded in shell/before.bash -> shell/node.bash
dko::has "nvm" && add-zsh-hook chpwd __auto_nvm_use

# ============================================================================
# Completion settings
# ============================================================================

# check that we're in the shell and not in something like vim terminal
if [[ "$0" == *"zsh" ]]; then
  # Use caching for commands that would like a cache.
  zstyle ':completion:*' use-cache true
  zstyle ':completion:*' cache-path "${XDG_CACHE_HOME}/.zcache"

  # --------------------------------------------------------------------------
  # Completion display
  # --------------------------------------------------------------------------

  # group all by the description above
  zstyle ':completion:*' group-name ''

  # colorful completion
  #zstyle ':completion:*' list-colors ''

  # Updated to respect LS_COLORS
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

  zstyle ':completion:*' list-dirs-first yes

  # go into menu mode on second tab (like current vim wildmenu setting)
  # only if there's more than two things to choose from
  zstyle ':completion:*' menu select=2

  # show descriptions for options
  zstyle ':completion:*' verbose yes

  # in Bold, specify what type the completion is, e.g. a file or an alias or
  # a cmd
  zstyle ':completion:*:descriptions' format '%F{black}%B%d%b%f'

  # --------------------------------------------------------------------------
  # Results matching
  # --------------------------------------------------------------------------

  # use case-insensitive completion if case-sensitive generated no hits
  zstyle ':completion:*' matcher-list \
    'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'

  # don't complete usernames
  zstyle ':completion:*' users ''

  # don't autocomplete homedirs
  zstyle ':completion::complete:cd:*' tag-order '! users'

  # --------------------------------------------------------------------------
  # Result output transformation
  # --------------------------------------------------------------------------

  # expand completions as much as possible on tab
  # e.g. start expanding a path up to wherever it can be until error
  zstyle ':completion:*' expand yes

  # colorful kill command completion
  zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"

  # process names
  zstyle ':completion:*:processes-names' command  'ps c -u ${USER} -o command | uniq'

  # SSH use hosts from ~/.ssh/config
  hosts=($(egrep '^Host ' "$HOME/.ssh/config" | grep -v '*' | awk '{print $2}' ))
  zstyle ':completion:*:hosts' hosts $hosts
fi

# ============================================================================
# After
# ============================================================================

. "${DOTFILES}/shell/after.bash"
dko::source "${DOTFILES}/local/zshrc"

# Started xtrace in dot.zshenv
if [[ "$DKO_PROFILE_STARTUP" == true ]]; then
    unsetopt xtrace
    exec 2>&3 3>&-
fi

export DKO_SOURCE="${DKO_SOURCE} }"

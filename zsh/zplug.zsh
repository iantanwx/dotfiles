# zplug.zsh
#
# Loaded by zplug when path assigned to ZPLUG_LOADFILE
#
# Use repo format for oh-my-zsh plugins so no random crap is sourced
#
# Make sure fpaths are defined before or within zplug -- it calls compinit
# again in between loading plugins and defer plugins.
#

# ----------------------------------------------------------------------------
# Mine
# ----------------------------------------------------------------------------

zplug "davidosomething/git-ink",  as:command
zplug "davidosomething/git-my",   as:command
zplug "davidosomething/git-take", as:command
zplug "paulirish/git-open",       as:command

# my fork of cdbk, zsh hash based directory bookmarking
zplug "davidosomething/cdbk"

# zplug "~/projects/vopen", \
#   from:local, \
zplug "davidosomething/vopen",     \
  use:"{vopen,vopen-nofork}", \
  as:command

# ----------------------------------------------------------------------------
# Vendor
# ----------------------------------------------------------------------------

zplug "plugins/colored-man-pages", from:oh-my-zsh

# In-line best history match suggestion
zplug "zsh-users/zsh-autosuggestions"

# Various program completions; includes go, nvm
# This adds to fpath (so before compinit)
zplug "zsh-users/zsh-completions"

# ----------------------------------------------------------------------------
# LAST, these call "compdef" so must be run after compinit
# ----------------------------------------------------------------------------

# fork of rupa/z with better completion (so needs defer)
zplug "knu/z",  \
  use:"z.sh",   \
  defer:2

# gulp completion (parses file so not 100% accurate)
zplug "akoenig/gulp.plugin.zsh", defer:2

zplug "lukechilds/zsh-better-npm-completion", \
  defer:2

# Moved if block outside since `zplug check` doesn't consider it
if [[ $OSTYPE == "darwin"* ]]; then
  zplug "vasyharan/zsh-brew-services",  \
    defer:2
fi

# # completions I have locally
# zplug "${ZDOTDIR}",     \
#   from:local,           \
#   use:"completions/_*", \
#   defer:18

# absolute last
# highlight as you type
zplug "zsh-users/zsh-syntax-highlighting", defer:3
zplug "greymd/docker-zsh-completion"

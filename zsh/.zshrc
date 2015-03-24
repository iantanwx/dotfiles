# .zshrc
# sourced only on interactive/TTY
# sourced on login after zprofile
# sourced when you type zsh

export DKOSOURCE="$DKOSOURCE -> zshrc"

source "$HOME/.dotfiles/shell/loader"
source "$HOME/.dotfiles/shell/aliases"

# helpfiles
has_program "brew" && {
  # use homebrew bundled zsh helpfiles for online help
  export HELPDIR="$BREW_PREFIX/share/zsh/helpfiles"
  unalias run-help
  autoload run-help
}

scripts=(
  "options"
  "aliases"
  "keybindings"
  "completions"
  "title"
  "prompt"
  "plugins"
)
for script in $scripts; do
  source "$ZDOTDIR/${script}.zsh"
done

source "$HOME/.dotfiles/shell/after"
source_if_exists "$HOME/.zshrc.local"


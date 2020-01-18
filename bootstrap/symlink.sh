#!/usr/bin/env bash
#
# Basic symlinks, safe to run on any system
#

set -e

# ============================================================================
# initialize script and dependencies
# ============================================================================

cd "$(dirname "$0")/.." || exit 1
readonly dotfiles_path="$(pwd)"
source "${dotfiles_path}/shell/helpers.bash"

# ============================================================================
# Main
# ============================================================================

__symlink() {
  dko::status "Symlinking dotfiles"

  # REQUIRED in ~/ -- ag looks for ~/.agignore LAST and includes it.
  # .ignore files are for project local only
  dko::symlink ag/dot.ignore                    .agignore

  # universal-ctags
  dko::symlink universal-ctags/dot.ctags        .ctags

  # XDG-compatible
  dko::symlink git/dot.gitconfig                .config/git/config
  dko::symlink git/dot.gitignore                .config/git/ignore
  dko::symlink shell/dot.inputrc                .config/readline/inputrc
  dko::symlink redshift/redshift.conf           .config/redshift/redshift.conf

  # (n)vim
  dko::symlink vim                              .vim
  dko::symlink vim                              .config/nvim
  dko::symlink vim/ideavimrc                    .ideavimrc

  # hyper.app
  dko::symlink hyper.app/dot.hyper.js           .hyper.js

  # default tern-project
  dko::symlink ternjs/dot.tern-project          .tern-project


  # window management
  case "$OSTYPE" in
    darwin*)
      dko::symlink chunkwm/dot.yabairc          .yabairc
      dko::symlink chunkwm/dot.skhdrc           .skhdrc
      ;;
    linux*)
      dko::symlink bspwm/bspwmrc                .config/bspwm/bspwmrc
      dko::symlink sxhkd/sxhkdrc                .config/bspwm/sxhkdrc
      dko::symlink polybar                      .config/polybar
  esac

  # Shell
  dko::symlink bash/dot.bashrc                  .bashrc
  dko::symlink bash/dot.bash_profile            .bash_profile
  dko::symlink zsh/dot.zshenv                   .zshenv

  dko::status "Done! [symlink.sh]"
}

__symlink

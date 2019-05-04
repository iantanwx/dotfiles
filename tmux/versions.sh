#!/usr/bin/env bash

__load() {
  readonly tmux_version="$(tmux -V | cut -c 6-8)"

  if [[ $(echo "$tmux_version >= 2.4" | bc) -eq 1 ]]; then
    tmux source-file "${DOTFILES}/tmux/t2.4.conf"
  else
    tmux source-file "${DOTFILES}/tmux/t1.conf"
  fi
}

__load


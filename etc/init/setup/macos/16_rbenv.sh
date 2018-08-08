#!/bin/bash
if [ -x $(command -v anyenv) ]; then
  if [ ! -x $(command -v rbenv) ]; then
    anyenv install rbenv
    # bash
    exec $SHELL -l
    # zsh

    # fish
    echo "set -x RBENV_ROOT \$HOME/.anyenv/envs/rbenv" >> ~/.config/fish/config.fish
    echo "set -x PATH \$PATH \$HOME/.anyenv/envs/rbenv/bin" >> ~/.config/fish/config.fish
    echo "set -gx PATH \$HOME/.anyenv/envs/rbenv/shims \$PATH" >> ~/.config/fish/config.fish
    echo "set -gx RBENV_SHELL fish" >> ~/.config/fish/config.fish
    echo "source \$HOME/.anyenv/envs/rbenv/libexec/../completions/rbenv.fish" >> ~/.config/fish/config.fish
  fi
  if [ -x $(command -v rbenv) ]; then
    # default 2.4.0
    rbenv install 2.4.0
    rbenv global 2.4.0   
  fi
fi

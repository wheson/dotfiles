#!/bin/bash
if [ -x $(command -v anyenv) ]; then
  if [ ! -x $(command -v pyenv) ]; then
    anyenv install pyenv
    echo "set -x PYENV_ROOT \$HOME/.anyenv/envs/pyenv" >> ~/.config/fish/config.fish
    echo "set -x PATH \$PATH \$HOME/.anyenv/envs/pyenv/bin" >> ~/.config/fish/config.fish
    echo "set -gx PATH \$HOME/.anyenv/envs/pyenv/shims \$PATH" >> ~/.config/fish/config.fish
  fi
  if [ -x $(command -v pyenv) ]; then
    # default 3.6.5
    pyenv install 3.6.5
    pyenv global 3.6.5   
  fi
fi

#!/bin/bash
if [ ! -x "$(command which anyenv)" ]; then
  git clone https://github.com/riywo/anyenv ~/.anyenv
  # bash
  echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bash_profile
  echo 'eval "$(anyenv init -)"' >> ~/.bash_profile
  exec $SHELL -l
  # zsh

  # fish
  echo "set PATH ~/.anyenv/bin \$PATH" >> ~/.config/fish/config.fish
fi

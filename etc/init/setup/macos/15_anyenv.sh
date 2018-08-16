#!/bin/bash
if !(type "anyenv" > /dev/null 2>&1); then
  git clone https://github.com/riywo/anyenv ~/.anyenv
  # bash
  echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bash_profile
  echo 'eval "$(anyenv init -)"' >> ~/.bash_profile
  source ~/.bash_profile
  # zsh

  # fish
  echo "set PATH ~/.anyenv/bin \$PATH" >> ~/.config/fish/config.fish
  echo "eval (anyenv init - | source)" >> ~/.config/fish/config.fish
fi

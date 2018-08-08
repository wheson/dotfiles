#!/bin/bash
if [ ! -x "$(command -v anyenv)" ]; then
  git clone https://github.com/riywo/anyenv ~/.anyenv
  echo "set PATH ~/.anyenv/bin \$PATH" >> ~/.config/fish/config.fish
fi

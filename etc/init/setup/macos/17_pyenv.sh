#!/bin/bash
if [ -x $(command -v anyenv) ]; then
  if [ ! -x $(command -v pyenv) ]; then
    anyenv install pyenv
    exec $SHELL -l
  fi
  if [ -x $(command -v pyenv) ]; then
    # default 3.6.5
    pyenv install 3.6.5
    pyenv global 3.6.5   
  fi
fi

#!/bin/bash
if [ -x $(command which anyenv) ]; then
  if [ ! -x $(command which pyenv) ]; then
    anyenv install pyenv
    source ~/.bash_profile
  fi
  if [ -x $(command which pyenv) ]; then
    # default 3.6.5
    pyenv install 3.6.5
    pyenv global 3.6.5
  fi
fi

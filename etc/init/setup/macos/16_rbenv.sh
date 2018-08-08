#!/bin/bash
if [ -x $(command which anyenv) ]; then
  if [ ! -x $(command which rbenv) ]; then
    anyenv install rbenv
    source ~/.bash_profile
  fi
  if [ -x $(command which rbenv) ]; then
    # default 2.4.0
    rbenv install 2.4.0
    rbenv global 2.4.0   
  fi
fi

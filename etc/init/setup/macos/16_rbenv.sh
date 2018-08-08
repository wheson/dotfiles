#!/bin/bash
if [ -x $(command type anyenv) ]; then
  if [ ! -x $(command type rbenv) ]; then
    anyenv install rbenv
    source ~/.bash_profile
  fi
  if [ -x $(command type rbenv) ]; then
    # default 2.4.0
    rbenv install 2.4.0
    rbenv global 2.4.0   
  fi
fi

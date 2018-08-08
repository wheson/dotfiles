#!/bin/bash
if [ -x $(command -v anyenv) ]; then
  if [ ! -x $(command -v rbenv) ]; then
    anyenv install rbenv
    exec $SHELL -l
  fi
  if [ -x $(command -v rbenv) ]; then
    # default 2.4.0
    rbenv install 2.4.0
    rbenv global 2.4.0   
  fi
fi

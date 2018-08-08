#!/bin/bash
if type "anyenv" > /dev/null 2>&1; then
  anyenv install rbenv
  if type "rbenv" > /dev/null 2>&1; then
    # default 2.4.0
    rbenv install 2.4.0
    rbenv global 2.4.0
  fi
fi

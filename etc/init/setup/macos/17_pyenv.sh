#!/bin/bash
if type "anyenv" > /dev/null 2>&1 then
  anyenv install pyenv
  if type "pyenv" > /dev/null 2>&1 then
    # default 3.6.5
    pyenv install 3.6.5
    pyenv global 3.6.5
  fi
fi

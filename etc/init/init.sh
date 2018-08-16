#!/bin/bash

e_arrow() {
    printf " \033[37;1m%s\033[m\n" "➜ $*"
}

if [ $(uname) = "Darwin" ]; then
  for i in "$DOTPATH"/etc/init/setup/macos/*.sh
  do
    if [ -f "$i" ]; then
      e_arrow "$(basename "$i")"; bash "$i"
    else
      continue
    fi
  done
  for i in "$DOTPATH"/etc/init/setup/macos/*.fish
  do
    if [ -f "$i" ]; then
      e_arrow "$(basename "$i")"; fish "$i"
    else
      continue
    fi
  done
fi

#!/bin/bash

e_arrow() {
    printf " \033[37;1m%s\033[m\n" "➜ $*"
}

for i in "$DOTPATH"/etc/init/setup/*.sh
do
    if [ -f "$i" ]; then
        e_arrow "$(basename "$i")"; bash "$i"
    else
        continue
    fi
done

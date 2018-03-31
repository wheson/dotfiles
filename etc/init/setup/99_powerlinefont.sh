#!/bin/bash
brew install --vim-powerline ricty
echo "cp -f /usr/local/Cellar/ricty/{version}/share/fonts/Ricty*.ttf ~/Library/Fonts/"
echo "fc-cache -vf"
echo "exec $SHELL -l"

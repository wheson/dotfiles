#!/bin/bash
if [ ! -x $(command which brew) ]; then
  echo "Installing homebrew..."
  which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "Run brew update..."
which brew >/dev/null 2>&1 && brew update

echo "OK. Run brew upgrade..."

brew upgrade --all

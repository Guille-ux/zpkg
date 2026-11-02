#!/bin/bash
cd $(dirname $0)

INCLUDE_LINE='export PATH="$HOME/.zpkg:$PATH"'

rm -rf ~/.zpkg/*
mkdir -p ~/.zpkg/pkgs
cp -r * ~/.zpkg/

touch "$HOME/.bashrc"

if grep -Fxq "$INCLUDE_LINE" "$HOME/.bashrc"; then
    echo "Already included on .bashrc"
else
    echo "" >> "$HOME/.bashrc" 
    echo "$INCLUDE_LINE" >> "$HOME/.bashrc"

fi

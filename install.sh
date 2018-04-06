#!/usr/bin/env bash

ln -s "$HOME/bin/bash_aliases" "$HOME/.bash_aliases"
echo "source $HOME/bin/bashrc" >> "$HOME/.profile"

#!/bin/bash

mkdir -p ~/.config

if ! [ -f ~/.config/nvim ]; then
  rm -rf ~/.config/nvim
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ln -s $SCRIPT_DIR ~/.config/nvim

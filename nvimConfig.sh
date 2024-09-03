#!/bin/bash

mkdir -p ~/.config/nvim/lua/config
mkdir -p ~/.config/nvim/lua/plugins

if ! [ -f ~/.config/nvim/init.vim ]; then
  cp init.vim ~/.config/nvim
fi

if ! [ -f ~/.config/nvim/lua/config/lazy.lua ]; then
  cp lazy.lua ~/.config/nvim/lua/config/lazy.lua
fi

if ! [ -f ~/.config/nvim/lua/plugins/spec.lua ]; then
  cp lazy.lua ~/.config/nvim/lua/plugins/spec.lua
fi




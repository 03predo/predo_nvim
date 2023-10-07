#!/bin/bash
if ! [ -d ~/.config ]; then
    mkdir ~/.config
fi

if ! [ -d ~/.config/nvim ]; then
    mkdir ~/.config/nvim
fi

if ! [ -f ~/.config/nvim/init.vim ]; then
    cp init.vim ~/.config/nvim
fi

if ! [ -d ~/.config/nvim/lua ]; then
    mkdir ~/.config/nvim/lua
fi

if ! [ -f ~/.config/nvim/lua/plugins.lua ]; then
    cp plugins.lua ~/.config/nvim/lua
fi


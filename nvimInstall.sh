#!/bin/bash
# install nvim
if ! [ -f /usr/bin/nvim ]; then
    apt install ripgrep
    sudo apt-add-repository ppa:git-core/ppa
    sudo apt-get update
    sudo apt-get install git
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    chmod u+x nvim.appimage
    ./nvim.appimage --appimage-extract
    ./squashfs-root/AppRun --version
    ln -s $PWD/squashfs-root/AppRun /usr/bin/nvim
fi


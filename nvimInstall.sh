#!/bin/bash
# install nvim
if ! [ -f /usr/bin/nvim ]; then
    # TODO: update to curl ripgrep, should be able to curl and add to path and telescope still pick it up
    # curl -LO 'https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz'
    # tar xf ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz
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


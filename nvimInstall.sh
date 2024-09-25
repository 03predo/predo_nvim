#!/bin/bash

# install nvim
if ! [ -f $HOME/.local/bin/nvim ]; then
    mkdir -p ~/.local/bin

    curl -LO 'https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz'
    tar xf ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz
    ln -s $PWD/ripgrep-13.0.0-x86_64-unknown-linux-musl/rg ~/.local/bin/rg

    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage 
    chmod +x $PWD/nvim.appimage
    ./nvim.appimage --appimage-extract
    ./squashfs-root/AppRun --version
    ln -s $PWD/squashfs-root/AppRun ~/.local/bin/nvim
    echo "export PATH="\$HOME/.local/bin:\$PATH"" >> $HOME/.bashrc
    . $HOME/.bashrc
fi

# config nvim
mkdir -p ~/.config

if [ -f ~/.config/nvim ]; then
  rm -rf ~/.config/nvim
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ln -s $SCRIPT_DIR ~/.config/nvim

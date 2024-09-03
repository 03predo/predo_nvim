FROM ubuntu:22.04

RUN apt-get update -y && \
    apt-get upgrade -y

RUN apt-get install -y \
    software-properties-common \
    dos2unix \
    ripgrep \
    curl

RUN apt-add-repository ppa:git-core/ppa -y && \
    apt-get update -y && \
    apt-get install git -y && \
    git config --global core.autocrlf false

RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage && \
    chmod u+x nvim.appimage && \
    ./nvim.appimage --appimage-extract && \
    ln -s $PWD/squashfs-root/AppRun /usr/bin/nvim && \
    update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 0

RUN git clone https://github.com/03predo/predo_nvim.git


# RUN mkdir -p /root/.config/nvim/lua/config && \
#     mkdir -p /root/.config/nvim/lua/plugins
# 
# RUN cp /predo_nvim/init.vim /root/.config/nvim && \
#     cp /predo_nvim/lazy.lua /root/.config/nvim/lua/config && \
#     cp /predo_nvim/spec.lua /root/.config/nvim/lua/plugins


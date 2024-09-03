FROM ubuntu:22.04

RUN apt-get update -y && \
    apt-get upgrade -y

RUN apt-get install \
    software-properties-common \
    dos2unix \
    ripgrep \
    curl

RUN apt-add-repository ppa:git-core/ppa -y && \
    apt-get update -y && \
    apt-get install git -y && \
    git config --global core.autocrlf false

RUN git clone git@github.com:03predo/predo_nvim.git

RUN mkdir -p /root/.config/nvim/lua/config && \
    mkdir -p /root/.config/nvim/lua/plugins

RUN cp /predo_nvim/init.vim /root/.config/nvim && \
    cp /predo_nvim/lazy.lua /root/.config/nvim/lua/config && \
    cp /predo_nvim/spec.lua /root/.config/nvim/lua/plugins

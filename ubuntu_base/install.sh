#!/usr/bin/env bash
#!/bin/bash

# Install all packeges and setup Ubuntu

# Update system
sudo apt update && sudo apt upgrade -y

# Install base software
# sudo apt install -y curl \
#     git-core \
#     nano \
#     wget \
#     iputils-ping \
#     iproute2 \
#     mc \
#     rsync \
#     zsh

# # Install oh-my-zsh
# echo "Install oh-my-zsh"
# sh -c "$(wget -O- https://github.com/ohmyzsh/ohmyzsh/raw/master/tools/install.sh)"

# echo "Change THEME ....."
# sed -i s/'ZSH_THEME="robbyrussell"/ZSH_THEME="xiong-chiamiov-plus"/g' .zshrc

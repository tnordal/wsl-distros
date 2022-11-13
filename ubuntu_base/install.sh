#!/usr/bin/env bash
#!/bin/bash

# Install all packeges and setup Ubuntu

# Update system
sudo apt update && sudo apt upgrade -y

# Install base software
sudo apt install -y curl \
    git-core \
    nano \
    wget \
    iputils-ping \
    iproute2 \
    mc \
    rsync \
    zsh

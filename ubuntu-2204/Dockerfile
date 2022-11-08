# First test

# Get Ubuntu 22.04
FROM ubuntu:22.04

LABEL maintainer="Tom Nordal <tnordal@gmail.com>"

# Update repositories
RUN apt update && apt upgrade -y
RUN apt install -y \
    curl \
    git-core \
    locales \
    nano \
    sudo \
    wget \
    zsh

# Prepare and Install Neovim
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:neovim-ppa/unstable -y
RUN apt update && apt install neovim -y

# Install LSP Server
RUN apt install python3-pip -y
RUN pip install pyright

# Set timezone
RUN DEBIAN_FRONTEND=noninteractive apt install -y tzdata
ENV TZ=Europe/Oslo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ >/etc/timezone

ARG WSL_USER
ARG WSL_USER_PASS

RUN locale-gen en_US.UTF-8
RUN adduser --quiet --disabled-password --shell /bin/zsh --home /home/${WSL_USER} --gecos "User" ${WSL_USER}
RUN echo "${WSL_USER}:${WSL_USER_PASS}" | chpasswd
RUN usermod -aG sudo ${WSL_USER}

RUN echo "[user]\ndefault=${WSL_USER}" >/etc/wsl.conf

USER $WSL_USER

WORKDIR /home/${WSL_USER}

RUN sh -c "$(wget -O- https://github.com/ohmyzsh/ohmyzsh/raw/master/tools/install.sh)"

# COPY zshrc /home/${WSL_USER}/.zshrc
ENV TERM xterm
ENV ZSH_THEME xiong-chiamiov-plus

# ZSH_THEME, Replace robbyrussell theme with xiong-chiamiov-plus
RUN sed -i s/'ZSH_THEME="robbyrussell"/ZSH_THEME="xiong-chiamiov-plus"/g' .zshrc


CMD ["/bin/zsh"]

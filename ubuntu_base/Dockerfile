# Base Distro
# Get Ubuntu 22.04
FROM ubuntu:22.04

LABEL maintainer="Tom Nordal <tnordal@gmail.com>"

# Update repositories
RUN apt update && apt upgrade -y
RUN apt install -y sudo locales

# Install base software
RUN apt install -y \
    curl \
    git-core \
    nano \
    sudo \
    wget \
    iputils-ping \
    iproute2 \
    mc \
    rsync \
    zsh


# Set timezone
RUN DEBIAN_FRONTEND=noninteractive apt install -y tzdata
ENV TZ=Europe/Oslo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ >/etc/timezone

ARG WSL_USER
ARG WSL_USER_PASS

RUN locale-gen en_US.UTF-8
RUN adduser --quiet --disabled-password --shell /bin/bash \ 
--home /home/${WSL_USER} --gecos "User" ${WSL_USER}

RUN echo "${WSL_USER}:${WSL_USER_PASS}" | chpasswd
RUN usermod -aG sudo ${WSL_USER}

RUN echo "[user]\ndefault=${WSL_USER}" >/etc/wsl.conf

WORKDIR /home/${WSL_USER}
COPY ./install.sh .
RUN chmod +x install.sh && chown ${WSL_USER}:${WSL_USER} install.sh

USER $WSL_USER

CMD ["/bin/bash"]
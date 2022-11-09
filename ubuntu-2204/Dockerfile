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
    iputils-ping \
    iproute2 \
    mc \
    rsync \
    zsh

# Prepare and Install Neovim
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:neovim-ppa/unstable -y
RUN apt update && apt install neovim -y

# Install LSP Server
RUN apt install python3-pip python3.10-venv -y
RUN pip install pyright

# Set timezone
RUN DEBIAN_FRONTEND=noninteractive apt install -y tzdata
ENV TZ=Europe/Oslo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ >/etc/timezone

ARG WSL_USER
ARG WSL_USER_PASS

RUN locale-gen en_US.UTF-8
RUN adduser --quiet --disabled-password --shell /bin/zsh \ 
--home /home/${WSL_USER} --gecos "User" ${WSL_USER}

RUN echo "${WSL_USER}:${WSL_USER_PASS}" | chpasswd
RUN usermod -aG sudo ${WSL_USER}

RUN echo "[user]\ndefault=${WSL_USER}" >/etc/wsl.conf

RUN mkdir /home/${WSL_USER}/.config
COPY ./config /home/${WSL_USER}/.config/nvim
RUN chown -R ${WSL_USER}:${WSL_USER} /home/${WSL_USER}/.config

USER $WSL_USER

WORKDIR /home/${WSL_USER}

RUN sh -c "$(wget -O- https://github.com/ohmyzsh/ohmyzsh/raw/master/tools/install.sh)"

# COPY zshrc /home/${WSL_USER}/.zshrc
ENV TERM xterm
ENV ZSH_THEME xiong-chiamiov-plus

# ZSH_THEME, Replace robbyrussell theme with xiong-chiamiov-plus
RUN sed -i s/'ZSH_THEME="robbyrussell"/ZSH_THEME="xiong-chiamiov-plus"/g' .zshrc

RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim \ 
~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install fonts Powerlevel10k
RUN mkdir -p ~/.local/share/fonts && cd ~/.local/share/fonts
RUN curl https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf \ 
-o ~/.local/share/fonts/'MesloLGS NF Regular.ttf'

RUN curl https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf \ 
-o ~/.local/share/fonts/'MesloLGS NF Bold.ttf'

RUN curl https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf \ 
-o ~/.local/share/fonts/'MesloLGS NF Italic.ttf'

RUN curl https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf \ 
-o ~/.local/share/fonts/'MesloLGS NF Bold Italic.ttf'

# Install Powerlevel10k
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k && \ 
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

CMD ["/bin/zsh"]

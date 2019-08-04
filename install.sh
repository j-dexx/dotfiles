#!/bin/sh

# Install zsh
apt install -y zsh


# Install the fuck
apt update
apt install -y python3-dev python3-pip python3-setuptools
pip3 install thefuck

# Install antibody
curl -sfL git.io/antibody | sh -s - -b /usr/local/bin

# Install neovim
apt install -y neovim

# Install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install rcm
add-apt-repository -y ppa:martin-frost/thoughtbot-rcm
apt-get update
apt-get install -y rcm

# Install dotfiles
rcup

# Install asdf
if [ -f ~/.asdf ]; then
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.3
fi
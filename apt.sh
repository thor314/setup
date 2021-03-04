#!/bin/bash

apt update

# zsh
apt install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# open pdfs w evince (popOS has evince by default)
#apt install evince

# i3 tiling window manager
apt install i3 feh conky scrot
# xbacklight set screen brightness (included in i3)
# dmenu for to launch apps in the i3 desktop (included in i3)
# feh for wallpaper
# dunst for notifications
# conky to display information about system
# scrot for screenshots
# NetworkManager-gnome to manage network conections

# discord
pushd ~/Downloads
wget -O discord-0.0.1.deb https://discordapp.com/api/download?platform=linux&format=deb
apt install discord
popd

# spotify https://www.spotify.com/us/download/linux/
apt install spotify-client

# apt install apt-transport-https curl gnupg
apt install emacs sqlite3 rg

# rust tools
apt install llvm clang

# npm, node via nvm
# https://github.com/nvm-sh/nvm
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
nvm install node

# Near cli
npm install -g near-cli

# brave browser
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
apt install brave-browser

# Gnome
apt install gnome-tweaks

# Messenging apps
wget -O- https://updates.signal.org/desktop/apt/keys.asc |  sudo apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" |  sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
apt install signal-desktop

add-apt-repository ppa:atareao/telegram
apt install telegram

# apt trails latest git version by a couple years
add-apt-repository ppa:git-core/ppa
apt reinstall git

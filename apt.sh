#!/bin/bash

apt update

# zsh
apt install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# open pdfs w evince
apt install evince

# i3 tiling window manager
# rofi as dmenu replacement
# scrot for screenshots
# feh for wallpaper
apt install i3 rofi feh conky scrot
# dunst for notifications
# conky to display information about system
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
apt install gist

# mail utility
# apt install sendmail

# ssl development library
# apt install libssl-dev

# export latex files
apt install texlive-latex-base
apt install texlive-fonts-recommended
apt install texlive-fonts-extra # Fat, 1.6Gb
apt install texlive-latex-extra

# zoom video conferencing
wget https://zoom.us/client/latest/zoom_amd64.deb
dpkg -i zoom_amd64.deb
apt install -f

# brother printer
# info: https://support.brother.com/g/b/downloadhowto.aspx?c=us&lang=en&prod=hll2350dw_us_eu_as&os=127&dlid=dlf006893_000&flang=4&type3=625
wget https://download.brother.com/welcome/dlf006893/linux-brprinter-installer-2.2.2-2.gz
gunzip linux-brprinter-installer-*.*.*-*.gz
bash linux-brprinter-installer-*.*.*-*
# Note: setup printer on wifi network then connect via IP address.

# blog stuff: clipboard command line tool
apt install xclip
apt install hugo


# if apt error: Target CNF is configured multiple times
# wget https://github.com/davidfoerster/aptsources-cleanup/archive/refs/tags/v0.1.7.5.2.tar.gz
# tar -xvf v0.1*
# cd aptsources-cleanup-0.1.7.5.2
# ./aptsources-cleanup

## try very hard to get emojis.
# sudo apt-add-repository ppa:eosrei/fonts\n
# sudo apt update
# apt install fonts-emojione
## try2 emoji: use debian direct install.
#git clone https://github.com/gentakojima/emojione-picker-ubuntu; cd emojione-picker-ubuntu
#git checkout v0.1
#./install.sh; cd ..

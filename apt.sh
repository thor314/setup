#!/bin/bash
alias ins='apt install -y'
alias cins='cargo install'
alias sins='snap install'
alias pins='pip3 install'
apt update
ins git # version control, if it's not already here

########################
### PACKAGE MANAGERS ###
########################
# Rust, Python, Node
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
rustup update
rustup toolchain install nightly
rustup default nightly
rustup target add wasm32-unknown-unknown --toolchain nightly
git clone https://github.com/rust-analyzer/rust-analyzer.git
pushd rust-analyzer
cargo xtask install --server
popd

ins python3-pip

# https://github.com/nvm-sh/nvm
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install node

################
### PACKAGES ###
################

# fully featured shell
ins zsh # better shell than bash
## zsh configuration framework
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ins vim-gui-common # fully featured vim
ins vim-runtime # fully featured vim

# CLI tools
cins ripgrep # better grep
ins gist # quickly share files via github
ins hugo # static site generator blog management
ins hub # github
pip3 install tldr # man-lite; quick, what does this CLI tool do?
ins pass # password manager CLI
ins xclip # clipboard
ins scrot # screenshot
pins pz # Python as a command line tool
cins --locked bat # better than cat
git clone https://github.com/eth-p/bat-extras # bat(diff|grep|man|pipe|watch)
pushd bat-extras && ./build.sh --install && popd

## if I eventually like window-managers like i3 or leftwm again, use these
# ins rofi # window switcher, app launcher, dmenu replacement
# ins feh # set background image
# ins conky # lightweight system monitor, display info
# ins dunst # desktop notifications

# Programming dependencies
ins llvm clang 

# latex 
ins texlive-latex-base texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra 

# GUI applications
ins gnome-tweaks # tweak destkop settings gui
ins evince # pdf viewer
sins firefox # browser
sins chromium # secondary browser
sins notion-snap # secondary notes
sins signal-desktop # messaging
sins spotify # spotify

# Python ; idk, I said python dependencies at one point
# libxcb-xfixes0-dev libxcb-shape0-dev 
# pins pywal 

###########################
# shame, shame, be better #
###########################
# wget https://zoom.us/client/latest/zoom_amd64.deb
# dpkg -i zoom_amd64.deb
# ins discord 
# 
# # install obsidian here: https://obsidian.md/download
# # sudo snap install --dangerous obsidian_0.13.23_amd64.snap
# 
# # vim plug 
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# redundant config (should be in a vc'd config file)
git config --global core.editor "code --wait"
git config --global merge.ff no


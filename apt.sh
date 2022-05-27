#!/bin/bash
alias ins='apt install -y'
alias cins='cargo install'
alias sins='snap install'
alias pins='pip3 install'
apt update
ins git 

pushd $HOME
git clone git@github.com:thor314/thor-blog.git --recurse-submodules
popd

########################
### PACKAGE MANAGERS ###
########################
# Rust, Python, Node, Go
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
rustup update
rustup toolchain install nightly
rustup default nightly
rustup target add wasm32-unknown-unknown --toolchain nightly

# install RA in VScode instead
# git clone https://github.com/rust-analyzer/rust-analyzer.git
# pushd rust-analyzer
# cargo xtask install --server
# popd

ins python3-pip

# https://github.com/nvm-sh/nvm
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install node

# may have to update verson
wget https://go.dev/dl/go1.18.2.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.*.*.linux-amd64.tar.gz

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
ins pass # password manager CLI
ins xclip # clipboard
ins maim # screenshot, better than scrot
ins fonts-firacode # ligature enabled programming font
wget https://github.com/larsenwork/monoid/blob/master/Monoisome/Monoisome-Regular.ttf\?raw\=true
pins pz # Python as a command line tool
cins --locked bat # better than cat
git clone https://github.com/eth-p/bat-extras # bat(diff|grep|man|pipe|watch)
pushd bat-extras && ./build.sh --install && popd
cins du-dust # replace du, df
ins duf
cins bottom --locked # top replacements
cins --git https://github.com/bvaisvil/zenith.git
cins difftastic # diff w/ precision
cins pipe-rename # file renamer tool
pins tldr # a fire replacement for man
ins xdotool # simulate pressing buttons, very useful script utility

# substrate deps
ins clang curl libssl-dev llvm libudev-dev pkg-config

# text replacement tool https://espanso.org/docs/get-started/
sudo snap install espanso --classic --channel=latest/edge
# Register espanso as a systemd service (required only once)
espanso service register
espanso start

# python packages
pins GitPython # manage git from python
pins pytest # testing suite

# npm install
# https://github.com/mermaid-js/mermaid-cli
npm install @mermaid-js/mermaid-cli && ./node_modules/.bin/mmdc -h

## if I eventually like window-managers like i3 or leftwm again, use these
ins rofi # window switcher, app launcher, dmenu replacement
# ins feh # set background image
# ins conky # lightweight system monitor, display info
# ins dunst # desktop notifications

# Programming dependencies
ins llvm clang 
# protolint
go install github.com/yoheimuta/protolint/cmd/protolint@latest

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
wget https://zoom.us/client/latest/zoom_amd64.deb
dpkg -i zoom_amd64.deb
ins discord 

# Emoji option 1 (use rofi)
./tk-rofi-emoji.sh
# Emoji option 2
sins emote # emoji picker on ctrl-alt-e
# Emoji option 3 - see espanso inline replacement options

# use flatpak, not snap, so that obsidian can access git
flatpak install md.obsidian.Obsidian

# terminal emulators #ins guake - use tdrop with alacritty instead
cins alacritty
git clone https://github.com/noctuid/tdrop && cd tdrop && sudo make install && cd ..

# Python ; idk, I installed these dependencies at one point, forget why
pins flake8 # linter, expands pep8 standard around pyflakes package
pins autopep8 # formatter
# pins black # alt formatter linter, stricter than autopep8

# pins pywal  # theme setting silliness, not too useful

###########################
# shame, shame, be better #
###########################
# vim plug 
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# if re-cloning github hack and running from multiple machines, remember to
# add a line about pulling first
# pushd ~/play
# git clone git@github.com:thor314/github_hack.git
# popd
# echo "/* 8,12,4 * * * /usr/bin/python3 ~/play/github_hack/main.py
# --backdate=1" >> /etc/crontab

# Some other ligature fonts I didn't get much use out of
# ins fonts-monoid
# sudo mkdir /usr/share/fonts/truetype/iosevka
# wget https://github.com/be5invis/Iosevka/releases/download/v15.3.1/super-ttc-iosevka-15.3.1.zip
# unzip *iosevka*
# sudo mv iosevka.ttc /usr/share/fonts/truetype/iosevka
# sudo fc-cache
 
# my protonvpn, may require version updates
wget https://protonvpn.com/download/protonvpn-stable-release_1.0.1-1_all.deb
sudo apt install gnome-shell-extension-appindicator gir1.2-appindicator3-0.1
sudo dpkg -i protonvpn-stable-release_1.0.1-1_all.deb
ins protonvpn-cli


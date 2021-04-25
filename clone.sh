#!/bin/bash

cd ~
git clone git@github.com:thor314/org2.git
mv org2 org
cd org
git clone git@github.com:thor314/thor-blog.git --recurse-submodules
cd ~
git clone git@github.com:thor314/emacs.git
mv emacs .emacs.d
git clone git@github.com:thor314/.dotfiles
cd .dotfiles
./install

# Note: This failed to actually set the wallpaper :[
# git clone git@github.com:DimaZirix/fedora-gdm-wallpaper.git
# cd fedora-gdm-wallpaper && ./set-gdm-wallpaper.sh ~/Pictures/like/ditherpunk.png

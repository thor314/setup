#!/bin/bash

cd ~
git clone git@github.com:thor314/org2.git
mv org2 org
cd org
git clone https://github.com/thor314/thor-blog.git
cd ~
git clone https://github.com/thor314/emacs.git
mv emacs .emacs.d
git clone https://github.com/thor314/.dotfiles
cd .dotfiles
./install

#!/bin/bash

# generate an ssh key for github
ssh-keygen -t ed25519 -C thorck@protonmail.com
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
echo "Go enter your ssh key: https://github.com/settings/keys"

# gpg
gpg --full-generate-key
gpg --list-secret-keys --keyid-format LONG
read -p "Enter your key id: " pubkey
gpg --armor --export $pubkey
echo "copy paste your pgp pubkey to github: https://github.com/settings/keys"
git config --global user.signingkey $pubkey
git config --global gpg.program gpg
# https://magit.vc/manual/ghub/Setting-the-Username.html#Setting-the-Username
git config --global github.user thor314

# create and store a
# github personal access token
# https://www.emacswiki.org/emacs/GnusAuthinfo
echo "go here: https://github.com/settings/tokens/new"
read -p "create a personal access token and enter it:" token
cat $token > .authinfo
gpg -e .authinfo
rm .authinfo
chmod 600 .authinfo.gpg
mv .authinfo.gpg ..

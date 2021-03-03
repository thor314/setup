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

# github personal access token
echo "go here: https://github.com/settings/tokens/new"
read -p "create a personal access token" token
cat $token > ghub_personal_access_token.org

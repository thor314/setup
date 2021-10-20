#!/bin/bash

# github ssh and gpg help: https://docs.github.com/en/github-ae@latest/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
# generate an ssh key for github
ssh-keygen -t ed25519 -C thorck@protonmail.com
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
echo "Go enter your ssh key: https://github.com/settings/keys"
# run this command on each login to automate ssh key entry
# ssh-keygen -f /home/thor/.ssh/id_ed25519

# as of august 2021, github is more annoying than ever. do this.
# https://github.com/microsoft/Git-Credential-Manager-Core#linux-install-instructions
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo apt-add-repository https://packages.microsoft.com/ubuntu/18.04/prod
sudo apt-get update
sudo apt-get install gcmcore
git-credential-manager-core configure

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
git config --global user.email thorck@protonmail.com

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

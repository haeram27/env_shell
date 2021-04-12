#!/usr/bin/env bash

# check result of execution for each line and quit running of this script when execution result is failed
set -e
set -o pipefail

#cd "$(dirname "${BASH_SOURCE}")"

function install() {
    cp -b ./bashrc.cust ~/.bashrc.cust
    cp -b ./p10k.zsh ~/.p10k.zsh
    cp -b ./zshrc ~/.zshrc
    cp -b ./zshrc.cust ~/.zshrc.cust
    cp -b ./alias.cust ~/.alias.cust
    cp -b ./bindkey.cust ~/.bindkey.cust
    cp -b ./env.cust ~/.env.cust
    cp -b ./gitconfig ~/.gitconfig
	
    echo >> ~/.bashrc
	echo '[[ -f ~/.bashrc.cust ]] && . ~/.bashrc.cust' >> ~/.bashrc
    
    tar xvfz ./dotzsh.tgz
    mkdir ~/.zsh; mv ./dotzsh/* ~/.zsh/
    rm -rf ./dotzsh
    chsh -s $(which zsh)

    chmod 644 ~/.[!.]*.cust ~/.gitconfig
    chmod 655 ~/.zsh
}

read -p "This may overwrite existing your current setting files in home directory. Are you sure? (y/n) " -n 1;
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
	install
fi

#!/bin/bash

# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPTPATH=$(dirname "$SCRIPT")

mkdir -p $HOME/.config


echo 'tmux nvim karabiner hammerspoon' | tr ' ' '\n' | \
    while read conf; do
        echo "linking $conf"
        ln -s "$SCRIPTPATH/config/$conf" "$HOME/.config/$conf"
    done

npm i --location=global vscode-langservers-extracted


defaults write org.hammerspoon.Hammerspoon MJConfigFile "$HOME/.config/hammerspoon/init.lua"

# setup nvm default packages
# see: https://github.com/nvm-sh/nvm#default-global-packages-from-file-while-installing
echo "Linking nvm default packages"
ln -s "$SCRIPTPATH/config/nvm/default-packages" "$HOME/.nvm/default-packages"

echo "done"


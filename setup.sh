#!/bin/bash

# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPTPATH=$(dirname "$SCRIPT")

mkdir -p $HOME/.config


echo 'tmux nvim karabiner' | tr ' ' '\n' | \
    while read conf; do
        echo "linking $conf"
        ln -s "$SCRIPTPATH/config/$conf" "$HOME/.config/$conf"
    done

npm i --location=global vscode-langservers-extracted

echo "done"


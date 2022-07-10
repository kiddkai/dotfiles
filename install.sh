#!/bin/bash

function install_or_upgrade {
    if brew ls --versions "$1" >/dev/null; then
        HOMEBREW_NO_AUTO_UPDATE=1 brew upgrade "$1"
    else
        HOMEBREW_NO_AUTO_UPDATE=1 brew install "$1"
    fi
}

function install_or_upgrade_cask {
    if brew ls --cask --versions "$1" >/dev/null; then
        HOMEBREW_NO_AUTO_UPDATE=1 brew upgrade --cask "$1"
    else
        HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask "$1"
    fi
}

install_or_upgrade stylua
install_or_upgrade ripgrep

install_or_upgrade_cask hammerspoon
install_or_upgrade_cask karabiner-elements


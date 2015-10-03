#!/bin/bash
# Ultimate vimrc (https://github.com/amix/vimrc)

VIMRC_DIR="$HOME/.vim_runtime"

if [ ! -d "$VIMRC_DIR" ]; then
    echo "Installing Ultimate vimrc."
    git clone https://github.com/amix/vimrc.git "$VIMRC_DIR"
    sh "$VIMRC_DIR"/install_awesome_vimrc.sh
else
    echo "Updating Ultimate vimrc"
    cd "$VIMRC_DIR"
    git pull --rebase
    sh install_awesome_vimrc.sh
fi

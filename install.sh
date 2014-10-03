#!/bin/bash
# Install script for installing my dotfiles on any *nix computer.
# Uses the The Ultimate vimrc by amix and the Prezto ZSH frame-
# work by sorin-ionescu. Inspired by the awesome dotfiles by 
# paulmillr, mathiasbynens, skwp, and holman.

DOTFILES_DIR="$HOME/.dotfiles"
VIMRC_DIR="$HOME/.vim_runtime"
PREZTO_DIR="$HOME/.zprezto"

link() {
    from="$1"
    to="$2"
    echo "Linking '$from' to '$to'"
    rm -f "$to"
    ln -s "$from" "$to"
}

# My dotfiles repo (https://github.com/roguephysicist/dotfiles)
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Installing Dotfiles."
    git clone https://github.com/roguephysicist/dotfiles.git "$DOTFILES_DIR"
    cd "$DOTFILES_DIR"
fi

# Ultimate vimrc (https://github.com/amix/vimrc)
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

# Prezto (https://github.com/sorin-ionescu/prezto)
if [ ! -d "$PREZTO_DIR" ]; then
    echo "Installing Prezto."
    git clone --recursive git@github.com:roguephysicist/prezto.git "$PREZTO_DIR"

    setopt EXTENDED_GLOB
    for rcfile in "$HOME"/.zprezto/runcoms/^README.md(.N); do
        ln -s "$rcfile" "$HOME/.${rcfile:t}"
    done
else


for location in $(find home -name '.*'); do
  file="${location##*/}"
  file="${file%.sh}"
  link "$dotfiles/$location" "$HOME/$file"
done

#if [[ `uname` == 'Darwin' ]]; then
#  link "$dotfiles/sublime/Packages/User/Preferences.sublime-settings" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
#fi

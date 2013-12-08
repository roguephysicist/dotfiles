#!/bin/bash

# Install newest version of zsh with homebrew if not already installed
if [ ! -e /usr/local/bin/zsh ]; then
	brew install zsh
fi

# Starting zsh
/bin/zsh

# Cloning my prezto git repository to $HOME/.zprezto
git clone --recursive https://github.com/roguephysicist/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Allowing for special character in filenames and symlinking into $HOME
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# Adding homebrew installed version to /etc/shells
sudo printf "/usr/local/bin/zsh" >> /etc/shells

# Changing default shell to new zsh installed by homebrew
chsh -s /usr/local/bin/zsh

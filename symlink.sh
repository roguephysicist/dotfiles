#!/bin/bash
# A very direct script for linking files into your Home directory.
# Add files as needed.

ln -sf $PWD/symlinked/zsh-zshrc $HOME/.zshrc
ln -sf $PWD/symlinked/git-gitconfig $HOME/.gitconfig
ln -sf $PWD/symlinked/git-gitignore $HOME/.gitignore
ln -sf $PWD/symlinked/todotxt-todo.cfg $HOME/.todo.cfg
ln -sf $PWD/symlinked/rsync-rsync_exclude $HOME/.rsync_exclude

#!/bin/bash
# A very direct script for linking files into your Home directory.
# Add files as needed.

ln -isf $PWD/bash.linux     $HOME/.bashrc
ln -isf $PWD/rc.d/gitconfig $HOME/.gitconfig
ln -isf $PWD/rc.d/gitignore $HOME/.gitignore
ln -isf $PWD/rc.d/screenrc  $HOME/.screenrc
ln -isf $PWD/rc.d/vimrc     $HOME/.vimrc

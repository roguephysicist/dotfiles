#!/bin/bash
# A very direct script for linking files into your Home directory.
# Add files as needed.

ln -sf $PWD/bash_profile    $HOME/.bash_profile
ln -sf $PWD/bashrc          $HOME/.bashrc
ln -sf $PWD/gitconfig       $HOME/.gitconfig
ln -sf $PWD/gitignore       $HOME/.gitignore
ln -sf $PWD/screenrc        $HOME/.screenrc

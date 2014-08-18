#!/bin/bash
# A very direct script for linking files into your Home directory.
# Add files as needed.
shell="$1"


ln -sf $PWD/symlinked/git-gitconfig $HOME/.gitconfig
ln -sf $PWD/symlinked/git-gitignore $HOME/.gitignore
ln -sf $PWD/symlinked/octave-octaverc $HOME/.octaverc
ln -sf $PWD/symlinked/rsync-rsync_exclude $HOME/.rsync_exclude
ln -sf $PWD/symlinked/shell-aliases $HOME/.aliases
ln -sf $PWD/symlinked/shell-exports $HOME/.exports
ln -sf $PWD/symlinked/shell-extra $HOME/.extra
ln -sf $PWD/symlinked/shell-functions $HOME/.functions
ln -sf $PWD/symlinked/shell-path $HOME/.path
ln -sf $PWD/symlinked/todotxt-todo.cfg $HOME/.todo.cfg

if [[ "$shell" == "bash" ]]; then
    ln -sf $PWD/symlinked/bash-aliases $HOME/.bash_aliases
    ln -sf $PWD/symlinked/bash-exports $HOME/.bash_exports
    ln -sf $PWD/symlinked/bash-profile $HOME/.bash_profile
    ln -sf $PWD/symlinked/bash-prompt $HOME/.bash_prompt
    ln -sf $PWD/symlinked/bash-bashrc $HOME/.bashrc
fi

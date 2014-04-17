# A very direct script for linking files into your Home directory.
# Add files as needed.
shell="$1"


ln -sfh $PWD/symlinked/git-gitconfig $HOME/.gitconfig
ln -sfh $PWD/symlinked/git-gitignore $HOME/.gitignore
ln -sfh $PWD/symlinked/rsync-rsync_exclude $HOME/.rsync-exclude
ln -sfh $PWD/symlinked/shell-aliases $HOME/.aliases
ln -sfh $PWD/symlinked/shell-exports $HOME/.exports
ln -sfh $PWD/symlinked/shell-extra $HOME/.extra
ln -sfh $PWD/symlinked/shell-functions $HOME/.functions
ln -sfh $PWD/symlinked/shell-path $HOME/.path
ln -sfh $PWD/symlinked/todotxt-todo.cfg $HOME/.todo.cfg

if [ "$shell" == "bash" ]; then
    ln -sfh $PWD/symlinked/bash-aliases $HOME/.bash_aliases
    ln -sfh $PWD/symlinked/bash-exports $HOME/.bash_exports
    ln -sfh $PWD/symlinked/bash-profile $HOME/.bash_profile
    ln -sfh $PWD/symlinked/bash-prompt $HOME/.bash_prompt
    ln -sfh $PWD/symlinked/bash-bashrc $HOME/.bashrc
fi
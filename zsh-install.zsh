#!/bin/zsh

# Execute this script with /bin/zsh!

# Only for OS X and homebrew
if [[ `uname` == Darwin ]]; then
    # Install newest version of zsh with homebrew if not already installed
    if [ ! -e /usr/local/bin/zsh ]; then
    	brew install zsh
    fi

    # Adding homebrew installed version to /etc/shells
    printf "/usr/local/bin/zsh\n" | sudo tee -a /etc/shells
    
    # Changing default shell to new zsh installed by homebrew
    chsh -s /usr/local/bin/zsh
fi

if [[ `hostname` == medusa ]]; then
    chsh -s /bin/zsh
fi

# Cloning my prezto git repository to $HOME/.zprezto
git clone --recursive https://github.com/roguephysicist/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Allowing for special character in filenames and symlinking into $HOME
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# Creating symlinks for files in custom/
customfiles=( $PWD/custom/* )

link() {
    from="$1"
    to="$2"
    echo "Linking '$from' to '$to'"
    rm -f "$to"
    ln -s "$from" "$to"
}

for location in "${customfiles[@]}"; do
    file="${location##*/}"
    file="${file%.sh}"
    link "$location" "$HOME/.$file"
done

printf "All done! Restart your terminal.\n"

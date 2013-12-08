#!/bin/bash
# modified from https://github.com/paulmillr/dotfiles

bashfiles=( $PWD/bash/* )
customfiles=( $PWD/custom/* )

link() {
    from="$1"
    to="$2"
    echo "Linking '$from' to '$to'"
    rm -f "$to"
    ln -s "$from" "$to"
}

for location in "${bashfiles[@]}" "${customfiles[@]}"; do
    file="${location##*/}"
    file="${file%.sh}"
    link "$location" "$HOME/.$file"
done

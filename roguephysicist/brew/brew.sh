#!/usr/bin/env bash

# Let's get this party started! Installing homebrew
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"

# Updating and adding taps
brew update
brew tap phinze/homebrew-cask

# My favorite tools
apps=(ack
	  bash-completion
	  brew-cask
	  brew-gem
	  coreutils
	  gfortran
	  gnuplot --cairo --latex --pdf --qt --with-x --wx
	  grc
	  htop-osx
	  ssh-copy-id
	  tree
	  vim --override-system-vi
	  wget
	  zsh
	  z)
printf "Installing my favorite tools with brew.\n"
for app in ${apps[*]}; do
	brew install $app
done

# A few gems: lunchy is for creating tasks with launchd 
#			  homesick is for dotfile management
printf "\nInstalling a few ruby gems with brew.\n"
brew gem lunchy
brew gem homesick

# Installing binary software in casks
binaries=(airserver
		appdelete
		boxer
		dropbox
		evernote
		firefox
		github
		gog-downloader
		handbrake
		iterm2
		keka
		kindle
		libreoffice
		lyx
		mactex
		max
		parallels-8
		pcalc
		rname
		silverlight
		skim
		sublime-text
		transmission
		truecrypt
		vlc
		xld
		xquartz
		zotero)
printf "\nOk, now we're going to install some binaries with brew-cask."
for binary in ${binaries[*]}; do
	read -p "Do you want to install $binary? (y/n)"
	if [[ $REPLY =~ ^[Yy]$ ]]; then 
		brew cask install $binary
	fi
done

# Clean up after yourself
brew cleanup -s
rm -rf brew --cache

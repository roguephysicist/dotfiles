Dotfiles
========

A repo that contains my set-up of dotfiles, suited for both macOS and Linux. It also contains information about the software I install and use on a daily basis.

Run `link.sh` to link the dotfiles to your home directory.

On macOS, I immediately change the following keyboard settings:

```
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write com.apple.loginwindow PowerButtonSleepsSystem -bool no
```

Standard utilities and programs
-----------
Almost everything is installed using Homebrew and Homebrew-Cask, including CLI and GUI programs. To install everything from a fresh macOS, the procedure is as follows:

1. Install Xcode Command Line Tools with `xcode-select --install`
2. Install [Homebrew](https://brew.sh)
3. Install the tools in the [Brewfile](./Brewfile) with `brew tap homebrew/bundle && brew bundle`

Things should be installed in the specified order; for example, Xcode provides all the necessary compilers for installing programs with Homebrew. A list of installed GUI apps is included in the next section. Remember to clean your system after running the above in order to recover a significant amount of space:

```
brew cleanup; brew cleanup -s; brew cask cleanup
```

There are two additional programs that should be installed outside of Homewbrew:

* [Anaconda Python](https://www.anaconda.com)
* [pdftk](https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/pdftk_server-2.02-mac_osx-10.11-setup.pkg)

Lastly, linking the Sublime Text 3 configuration files and synchronizing them through Dropbox is detailed [here](https://packagecontrol.io/docs/syncing#dropbox-osx).


Boilerplate
-----------
Boilerplate apps are my standard set of graphical apps that I use on every computer. These are installed automatically using Homebrew-Cask (see the [Brewfile](./Brewfile)).

| Application    | Website                                        |
|----------------|------------------------------------------------|
| 1Password 6    | https://agilebits.com/onepassword              |
| Sublime Text 3 | http://www.sublimetext.com                     |
| iTerm 2        | http://www.iterm2.com/                         |
| Github for Mac | https://mac.github.com                         |
| PCalc 4        | http://www.pcalc.com                           |
| Spectacle      | http://spectacleapp.com                        |
| nvALT          | http://brettterpstra.com/projects/nvalt/       |
| Skim           | http://skim-app.sourceforge.net                |
| Zotero         | https://www.zotero.org                         |
| Dropbox        | https://www.dropbox.com                        |
| Daisydisk      | http://www.daisydiskapp.com                    |
| Keka           | http://www.kekaosx.com/en/                     |
| AppCleaner     | http://freemacsoft.net/appcleaner/             |
| R-Name         | https://www.macupdate.com/app/mac/12259/r-name |
| VirtualBox     | https://www.virtualbox.org                     |
| VLC            | http://www.videolan.org/vlc/index.html         |
| Spotify        | https://www.spotify.com/download/mac/          |
| Firefox        | http://www.mozilla.org/en-US/firefox/new/      |
| Skype          | https://www.skype.com/en/                      |
| Transmission   | http://www.transmissionbt.com                  |
| Whatsapp       | https://www.whatsapp.com                       |

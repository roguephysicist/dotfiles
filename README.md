Dotfiles
========

Install
-------
Run `link.sh` do link the dotfiles to your home. Then run `vimrc-install.sh`
do install the Ultimate vimrc.

Features
--------
```
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write com.apple.loginwindow PowerButtonSleepsSystem -bool no
```

Does not work in El Capitan:
```
defaults write com.apple.finder QLEnableTextSelection -bool TRUE; killall Finder
```
and also causes the infamous "blank quicklook image" bug.

Include some pictures
add installation of QLStephen from https://github.com/whomwah/qlstephen

Awesome applications for vanilla OS X installs
----------------------------------------------

This is a list of applications that I install on every Mac that I use.

Install First
-------------
There are a few of these apps that should be installed first so that everything
goes smoothly afterwards. These apps are:

1. Xcode Command Line Tools
2. XQuartz
3. Homebrew and tools in Brewfile
4. Github for Mac

Xcode provides all the necessary compilers for installing programs with
Homebrew. Read more in the Utilities section below.

XQuartz is mostly optional but some programs have some X11 dependencies that
require it.

Refer to the appropriate sections below for more information.

Utilities
---------
These are required installs for any kind of dev work.

* The Xcode Command Line Tools, installed with `xcode-select --install`.
* [XQuartz](https://xquartz.macosforge.org/landing/)

Homebrew
--------
[Homebrew](http://brew.sh) can be installed by following the instructions at
[http://brew.sh](http://brew.sh). Xcode and its respective command line tools
are required for installing Homebrew. Included in this directory is a Brewfile
that automatically installs a bunch of excellent tools. You can use this file
by running

`brew bundle Brewfile`

`git` is installed by defualt starting with OS X Mavericks. Brew will install
a more recent version but that step is entirely optional.

Finishing this step basically makes the system fully useable from the command
line. Text editors, productivity apps, and other graphical apps are installed
in the next section.

Boilerplate
-----------
Boilerplate apps are my standard set of apps that I use on every computer.
**Github for Mac** should be installed first, although it's likely you are
already aware of that if you read the sections above.

You can install most of these apps automatically using the excellent 
[getmacapps](http://www.getmacapps.com) website.

| Application    | Download From                                                   |
|----------------|:---------------------------------------------------------------:|
| 1Password 6    | [Website      ](https://agilebits.com/onepassword)              |
| Airmail 3      | [Mac App Store](http://airmailapp.com)                          |
| Sublime Text 3 | [Website      ](http://www.sublimetext.com)                     |
| iTerm 2        | [Website      ](http://www.iterm2.com/)                         |
| Github for Mac | [Website      ](https://mac.github.com)                         |
| PCalc 4        | [Mac App Store](http://www.pcalc.com)                           |
| Spectacle      | [Website      ](http://spectacleapp.com)                        |
| nvALT          | [Website      ](http://brettterpstra.com/projects/nvalt/)       |
| Skim           | [Website      ](http://skim-app.sourceforge.net)                |
| Zotero         | [Website      ](https://www.zotero.org)                         |
| Dropbox        | [Website      ](https://www.dropbox.com)                        |
| Daisydisk      | [Mac App Store](http://www.daisydiskapp.com)                    |
| Keka           | [Website      ](http://www.kekaosx.com/en/)                     |
| AppCleaner     | [Website      ](http://freemacsoft.net/appcleaner/)             |
| R-Name         | [Website      ](https://www.macupdate.com/app/mac/12259/r-name) |
| VirtualBox     | [Website      ](https://www.virtualbox.org)                     |
| VLC            | [Website      ](http://www.videolan.org/vlc/index.html)         |
| Spotify        | [Website      ](https://www.spotify.com/download/mac/)          |
| Firefox        | [Website      ](http://www.mozilla.org/en-US/firefox/new/)      |
| Skype          | [Website      ](https://www.skype.com/en/)                      |
| Transmission   | [Website      ](http://www.transmissionbt.com)                  |

Command Line
------------
These apps are only used in the terminal. This list does not include Homebrew
or programs installed with Homebrew. Read the preceeding section for more info
on that. 

* [Anaconda Python Distribution](https://www.continuum.io/downloads)
* [pdftk](https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/pdftk_server-2.02-mac_osx-10.11-setup.pkg)
* [Vagrant](https://www.vagrantup.com)

Sublime Text 3
--------------

Sublime Text has a command line interface called `subl`. You can use this from
the command line by symlinking as follows:

`ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl`

You can then run `subl` from the terminal to open or create a file.

Linking the Sublime Text 3 configuration files and synchronizing them through
Dropbox is detailed [here](https://packagecontrol.io/docs/syncing#dropbox-osx).

MacTeX
------
I typically install the full [MacTeX distribution](http://tug.org/mactex/) on
all my computers. This can be skipped if you aren't planning on using LaTeX.
It is a big (and often slow) download. It might be worth reconsidering in favor
of the much slimmer BasicTeX.

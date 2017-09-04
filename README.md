Dotfiles
========

A repo that contains my set-up of dotfiles, suited for both macOS and Linux. It also contains information about the software I install and use on a daily basis.

Run `link.sh` to link the dotfiles to your home directory.


Utilities
-----------
There are a few of these apps that should be installed first so that everything goes smoothly afterwards. These apps are:

1. Xcode Command Line Tools (install with `xcode-select --install`)
2. [XQuartz](https://xquartz.macosforge.org/landing/)
3. [Homebrew](https://brew.sh) and tools in [Brewfile](./Brewfile)
4. [Github for Mac](https://mac.github.com)

These are required installs for any kind of dev work; for example, Xcode provides all the necessary compilers for installing programs with Homebrew. XQuartz is mostly optional but some programs have some X11 dependencies that require it. `git` comes by default with macOS, but I also install a more recent version via Homebrew. You can also install useful Git command line tools from the Github desktop app.

Installing these programs basically makes the system fully usable from the command line. Text editors, productivity apps, and other graphical apps are installed in the next section.


Boilerplate
-----------
Boilerplate apps are my standard set of graphical apps that I use on every computer. **Github for Mac** should be installed first, although it's likely you are already aware of that if you read the preceding section. You can install most of these apps automatically using the [getmacapps](http://www.getmacapps.com) website.

| Application    | Download From                                                   |
|----------------|:---------------------------------------------------------------:|
| 1Password 6    | [Website      ](https://agilebits.com/onepassword)              |
| Sublime Text 3 | [Website      ](http://www.sublimetext.com)                     |
| iTerm 2        | [Website      ](http://www.iterm2.com/)                         |
| Github for Mac | [Website      ](https://mac.github.com)                         |
| PCalc 4        | [Mac App Store](http://www.pcalc.com)                           |
| Spectacle      | [Website      ](http://spectacleapp.com)                        |
| nvALT          | [Website      ](http://brettterpstra.com/projects/nvalt/)       |
| Skim           | [Website      ](http://skim-app.sourceforge.net)                |
| Zotero         | [Website      ](https://www.zotero.org)                         |
| Dropbox        | [Website      ](https://www.dropbox.com)                        |
| Daisydisk      | [Website      ](http://www.daisydiskapp.com)                    |
| Keka           | [Website      ](http://www.kekaosx.com/en/)                     |
| AppCleaner     | [Website      ](http://freemacsoft.net/appcleaner/)             |
| R-Name         | [Website      ](https://www.macupdate.com/app/mac/12259/r-name) |
| VirtualBox     | [Website      ](https://www.virtualbox.org)                     |
| VLC            | [Website      ](http://www.videolan.org/vlc/index.html)         |
| Spotify        | [Website      ](https://www.spotify.com/download/mac/)          |
| Firefox        | [Website      ](http://www.mozilla.org/en-US/firefox/new/)      |
| Skype          | [Website      ](https://www.skype.com/en/)                      |
| Transmission   | [Website      ](http://www.transmissionbt.com)                  |
| Whatsapp       | [Mac App Store](https://www.whatsapp.com)                  |


Command Line
------------
These apps are only used in the terminal. This list does not include Homebrew or programs installed with Homebrew.

* [Anaconda Python](https://www.anaconda.com)
* [pdftk](https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/pdftk_server-2.02-mac_osx-10.11-setup.pkg)
* [Vagrant](https://www.vagrantup.com)


Sublime Text 3
--------------

Sublime Text has a command line interface called `subl`. You can use this from the command line by symlinking as follows:

`ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl`

You can then run `subl` from the terminal to open or create a file.

Linking the Sublime Text 3 configuration files and synchronizing them through Dropbox is detailed [here](https://packagecontrol.io/docs/syncing#dropbox-osx).


MacTeX
------
I typically install the full [MacTeX distribution](http://tug.org/mactex/) on all my computers. This can be skipped if you aren't planning on using LaTeX. It is a big (and often slow) download. It might be worth reconsidering in favor of the much slimmer BasicTeX.


Misc.
--------
```
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write com.apple.loginwindow PowerButtonSleepsSystem -bool no
```

Does not work in El Capitan and later:
```
defaults write com.apple.finder QLEnableTextSelection -bool TRUE; killall Finder
```
and also causes the infamous "blank quicklook image" bug.

Need to mention [QLStephen](https://github.com/whomwah/qlstephen)

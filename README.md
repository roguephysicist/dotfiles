Dotfiles
========

A repo that contains my set-up of dotfiles, suited for both macOS and Linux. It also contains information about the software I install and use on a daily basis.

Run `link.sh` to link the dotfiles to your home directory.

On macOS, I immediately change the following keyboard settings:

```
defaults write com.apple.mail DisableInlineAttachmentViewing -bool yes
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write com.apple.loginwindow PowerButtonSleepsSystem -bool no
```

Standard utilities and programs
-----------
Command line programs are installed using MacPorts. To install everything from a fresh macOS, the procedure is as follows:

1. Install Xcode (full and command line tools).
2. Follow instructions from the [MacPorts website](https://www.macports.org/install.php).
3. Install utilities using MacPorts:

```
sudo port install ack \
                  bash \
                  bash-completion \
                  curl \
                  gcc10 \
                  git \
                  gnuplot \
                  htop \
                  tree \
                  vim \
                  wget \
                  xorg-server \
                  z
```

Other optional utils:

```
coreutils      # updated shell/system utils
diff-pdf       # visually compares to pdf files for differences
exiftool       # image metadata handling
ffmpeg         # a/v handling, 'with-fdk-aac' for ALAC
gifsicle       # handling and optimizing gifs
imagemagick    # convert, edit, or compose bitmap images
lcdf-typetools # dealing with Adobe fonts for LaTeX
pandoc         # converting between document formats
potrace        # creating vector images of signatures
povray         # for ray-tracing, especially for 3D visualizations
tesseract      # process image files into text with OCR
```

Additionally, I use [Anaconda Python](https://www.anaconda.com) for scientific Python development.

Lastly, linking the Sublime Text 3 configuration files and synchronizing them through Dropbox is detailed [here](https://packagecontrol.io/docs/syncing#dropbox-osx).


Boilerplate
-----------
Boilerplate apps are my standard set of graphical apps that I use on every computer.

| Application    | Website                                        |
|----------------|------------------------------------------------|
| Firefox        | https://www.mozilla.org/en-US/                 |
| Sublime Text 3 | http://www.sublimetext.com                     |
| iTerm 2        | http://www.iterm2.com/                         |
| Github for Mac | https://mac.github.com                         |
| Spectacle      | http://spectacleapp.com                        |
| Skim           | http://skim-app.sourceforge.net                |
| Zotero         | https://www.zotero.org                         |
| Dropbox        | https://www.dropbox.com                        |
| Daisydisk      | http://www.daisydiskapp.com                    |
| Keka           | http://www.kekaosx.com/en/                     |
| AppCleaner     | http://freemacsoft.net/appcleaner/             |
| R-Name         | https://www.macupdate.com/app/mac/12259/r-name |
| VLC            | http://www.videolan.org/vlc/index.html         |
| Spotify        | https://www.spotify.com/download/mac/          |
| Skype          | https://www.skype.com/en/                      |
| Transmission   | http://www.transmissionbt.com                  |
| KeepassXC      | https://keepassxc.org/                         |
| Cryptomator    | https://cryptomator.org/                       |
| 1Password 6    | https://agilebits.com/onepassword              |

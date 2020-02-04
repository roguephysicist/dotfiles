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

Standard utilities and programs for MacOS
-----------
Command line programs are installed using MacPorts. To install everything on a fresh macOS, the procedure is as follows:

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

# Dotfiles

A repo that contains my dotfiles that are suitable for both Linux and macOS.


## Usage

Simply run `make linux` or `make macos` depending on your OS. `make clean` will
safely unlink the dotfiles.

Additionally, I use [Anaconda Python](https://www.anaconda.org) for scientific
Python development; both the full distribution and `miniconda`. I also use
Sublime Text 3 as my primary text editor. Read about linking its configuration
files and synchronizing them through cloud storage
[here](https://packagecontrol.io/docs/syncing#dropbox-osx).


## Linux Particulars

### Gnuplot

The Gnuplot binary that comes packaged with most distros has a buggy readline
implementation that makes autocomplete totally unusable. It is easy to compile
from source after installing the necessary software,

```sh
dnf install g++ wxGTK3-devel readline-devel gd-devel libcerf-devel
```

which enables the `wxt` interactive terminal within Gnuplot, along with a few
other features.


## macOS Particulars


### Built-in macOS options

I change the following keyboard settings,

```
defaults write com.apple.mail DisableInlineAttachmentViewing -bool yes
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write com.apple.loginwindow PowerButtonSleepsSystem -bool no
```


### Standard utilities and programs for MacOS

macOS has no official package manager or even a standard way for installing
software from the command line. Various utilities exist to help solve this
problem, each with their own set of pros and cons. In my experience, Homebrew
is generally the *least painful* to use on a daily basis. Installation is
straightforward:

1. Install Xcode command line tools (`xcode-select --install`).
2. Follow instructions from the [Homebrew website](https://brew.sh).
3. Install programs:

```
brew install ack \
             bash \
             bash-completion \
             curl \
             gcc \
             git \
             htop \
             tree \
             vim \
             wget \
             z
```

There are many other tools that I don't use on a regular basis:

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


### Gnuplot

Homebrew can install Gnuplot, the resulting binary has a buggy autocomplete
functionality that makes it completely unusable. I suggest using `brew` to
install its dependencies, then manually compile Gnuplot from source. The
`configure` script should correctly autodetect the dependencies installed with
`brew`.

```
# Homebrew prefix
HBPRE="$(brew --prefix)"

# Install dependencies
brew install gd libcerf pango cairo readline ncurses libcaca pkgconfig wxwidgets

# Configure with correct readline and ncurses
./configure LDFLAGS="-L${HBPRE}/opt/readline/lib -L${HBPRE}/opt/ncurses/lib" \
            CPPFLAGS="-I${HBPRE}/opt/readline/include -I${HBPRE}/opt/ncurses/include" \
            --with-readline=gnu

# Make and install in /usr/local/bin
make
sudo make install

# Fix jumbled fonts (https://stackoverflow.com/questions/57698204/gnuplot-pdf-terminal-exhibits-font-issues-on-mac)
brew uninstall --ignore-dependencies pango
brew install iltommi/brews/pango
```

This will yield a fully working version of Gnuplot.

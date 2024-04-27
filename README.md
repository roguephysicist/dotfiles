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

### Basic Packages 

I currently use Debian 12 within the WSL2; Debian would be my choice of distro for a
traditional installation as well. There are basic system packages that I recommend:

```sh
apt install vim wget curl tree git gcc gfortran htop bash-completion exiftool imagemagick poppler-utils apt-file
apt install python3 python3-pip python3-numpy python3-scipy python3-pyqtgraph pylint 
apt install texlive-full
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
             coreutils \
             curl \
             diff-pdf \
             exiftool \
             ffmpeg \
             gcc \
             git \
             htop \
             imagemagick \
             jq \
             lolcat \
             make \
             ncdu \
             pandoc \
             poppler \
             python \
             tree \
             ttyplot \
             vim \
             wget \
             z
```

There are many other tools that I don't use on a regular basis but are also quite useful:

```
scrcpy         # android screen sharing for mac
gifsicle       # handling and optimizing gifs
lcdf-typetools # dealing with Adobe fonts for LaTeX
potrace        # creating vector images of signatures
povray         # for ray-tracing, especially for 3D visualizations
tesseract      # process image files into text with OCR
```

If you want to remove caches and clean stuff up:

```sh
brew cleanup -s && brew cleanup --prune=all
```

and if you want to remove everything and start over, I recommend this:

```sh
# BE CAREFUL!
for i in $(brew list); do brew uninstall --ignore-dependencies $i; done
```


### Python on macOS

Python modules are essential for many tasks now.

```sh
python3 -m pip install matplotlib \
                       numpy \
                       pandas \
                       PyOpenGL \
                       PyQt6 \
                       pyqtgraph \
                       python-kasa \
                       PyYAML \
                       ruamel.yaml \
                       ruamel.yaml.clib \
                       Sphinx \
                       sphinx-rtd-theme
```


## Gnuplot

Gnuplot is the greatest graphing tool ever created -- indeed, it is the truly
the pinnacle of all graphing tools. You would be very wise to listen to me, so I
am dedicating a section to it. In general, the Gnuplot binary distributed with
most package managers (`brew`, `apt`, `yum`, etc.) is sadly deficient;
therefore, I recommend installing from source. The `configure` script should
correctly autodetect the dependencies installed via system packages (Linux) or
with `brew` (macOS). You can execute the following script within the Gnuplot
source directory.

```
#!/bin/bash
export LC_CTYPE=C
export LANG=C

if [ $OSTYPE = "Darwin"* ]; then
    HBPRE="$(brew --prefix)"
    brew install gd \
                 libcerf \
                 pango \
                 cairo \
                 readline \
                 ncurses \
                 libcaca \
                 pkgconfig \
                 wxwidgets \
                 libsvg-cairo

    ./configure LDFLAGS="-L${HBPRE}/opt/ncurses/lib" \
                CPPFLAGS="-I${HBPRE}/opt/ncurses/include" \
                --with-readline=${HBPRE}/opt/readline \
                --with-qt=no \
                --prefix="/opt/gnuplot"
elif [ $OSTYPE = "linux-gnu" ]; then
    sudo apt install -y libgd-dev \
                        libcerf-dev \
                        libcairo2-dev \
                        libpango1.0-dev \
                        libwxgtk3.2-dev \
                        libreadline-dev \
                        libncurses-dev \
                        cairosvg \
                        libcaca-dev \
                        libqt6core6 \
                        libqt6gui6 \
                        libqt6network6 \
                        libqt6svg6 \
                        libqt6printsupport6 \
                        libqt6core5compat6 \
                        qt6-svg-dev \
                        qt6-5compat-dev \
                        liblua5.3-dev \
                        qt6-tools-dev \
                        lua5.3

    ./configure --with-caca --with-readline=gnu --prefix="/opt/gnuplot"
fi

# Make and install
make -j4
make check
sudo make install
```

This will yield a fully working version of Gnuplot.

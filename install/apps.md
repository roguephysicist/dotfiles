Awesome applications for vanilla OS X installs
==============================================

This is a list of applications that I install on every Mac that I use.

Install First
-------------
There are a few of these apps that should be installed first so that everything
goes smoothly afterwards. These apps are:

1. Xcode Command Line Tools
2. XQuartz
3. Homebrew and tools in Brewfile
4. Github for Mac (with command line tools)

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
[Homebrew](http://brew.sh) can be installed by running

`ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"`

in the terminal. Xcode and its respective command line tools are
required for installing Homebrew. Included in this directory is a Brewfile
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

| Application    | Download From                                                    | Application    | Download From                                                    |
|----------------|:----------------------------------------------------------------:|----------------|:----------------------------------------------------------------:|
| 1Password 4    | [Website      ](https://agilebits.com/onepassword)               | Skim           | [Website      ](http://skim-app.sourceforge.net)                 |
| Sublime Text 3 | [Website      ](http://www.sublimetext.com)                      | Zotero         | [Website      ](https://www.zotero.org)                          |
| iTerm 2        | [Website      ](http://www.iterm2.com/)                          | Dropbox        | [Website      ](https://www.dropbox.com)                         |
| Alfred 2       | [Website      ](http://www.alfredapp.com)                        | Spectacle      | [Website      ](http://spectacleapp.com)                         |
| Github for Mac | [Website      ](https://mac.github.com)                          | Daisydisk      | [Mac App Store](http://www.daisydiskapp.com)                     |
| PCalc 4        | [Mac App Store](http://www.pcalc.com)                            | Keka           | [Website      ](http://www.kekaosx.com/en/)                      |
| ReadKit        | [Mac App Store](http://readkitapp.com)                  			| AppDelete      | [Website      ](http://www.reggieashworth.com/appdelete)         |
| Evernote       | [Mac App Store](http://evernote.com/evernote/)                   | R-Name         | [Website      ](https://www.macupdate.com/app/mac/12259/r-name)  |
| Fantastical    | [Website      ](https://flexibits.com/fantastical)               | VLC            | [Website      ](http://www.videolan.org/vlc/index.html)          |
| Ulysses III    | [Mac App Store](http://www.ulyssesapp.com)                       | Spotify        | [Website      ](https://www.spotify.com/download/mac/)           |
| Mindnode Pro   | [Mac App Store](https://mindnode.com)                            | Firefox        | [Website      ](http://www.mozilla.org/en-US/firefox/new/)       |
| nvALT          | [Website      ](http://brettterpstra.com/projects/nvalt/)        |                | [Website      ](https://www.virtualbox.org)                      |

Command Line
------------
These apps are only used in the terminal. This list does not include Homebrew
or programs installed with Homebrew. Read the preceeding section for more info
on that. 

* [Anaconda Python Distribution](https://store.continuum.io/cshop/anaconda/)
* [pdftk](http://www.pdflabs.com/tools/pdftk-server/)
* [Vagrant](https://www.vagrantup.com)

Sublime Text has a command line interface called `subl`. You can use this from
the command line by symlinking as follows:

`ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl`

You can then run `subl` from the terminal to open or create a file.

MacTeX
------
I typically install the full [MacTeX distribution](http://tug.org/mactex/) on
all my computers. This can be skipped if you aren't planning on using LaTeX.
It is a big (and often slow) download. It might be worth reconsidering in favor
of the much slimmer BasicTeX.

System Fonts
-------
Excellent free fonts. These are mostly OpenType and support advanced features.

* (EB Garamond)         [http://www.georgduffner.at/ebgaramond/]
* (Essays 1743)         [http://www.thibault.org/fonts/essays/]
* (Forum)               [http://www.fontsquirrel.com/fonts/forum]
* (Gentium Plus)        [http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=Gentium_download]
* (Inconsolata)         [http://levien.com/type/myfonts/inconsolata.html]
* (Lato)                [http://www.latofonts.com/lato-free-fonts/]
* (Linux Biolinum)      [http://www.linuxlibertine.org/index.php?id=1&L=1]
* (Linux Libertine)     [http://www.linuxlibertine.org/index.php?id=1&L=1]
* (Roboto)              [http://www.fontsquirrel.com/fonts/roboto]
* (Sina Nova)           [http://www.fontsquirrel.com/fonts/sina-nova]
* (Source Code Pro)     [https://github.com/adobe-fonts/source-code-pro]
* (Source Sans Pro)     [https://github.com/adobe-fonts/source-sans-pro]
* (Source Serif Pro)    [https://github.com/adobe-fonts/source-serif-pro]

Awesome applications for vanilla OS X installs
==============================================

This is a list of applications that I install on every Mac that I use.

Install First
-------------
There are a few of these apps that should be installed first so that everything
goes smoothly afterwards. These apps are:

1. Github for Mac (with command line tools)
2. Xcode (with command line tools)
3. XQuartz
4. Homebrew and tools in Brewfile

Github is installed first to get a fresh install of Git. There are other ways
you can go about this but this is easiest.

Xcode follows to get all the necessary compilers for installing programs with
Homebrew. Read more in the Utilities section below.

XQuartz is mostly optional but some programs have some X11 dependencies that
require it.

Refer to the appropriate sections below for more information.

Utilities
---------
These are required installs for any kind of dev work.

* [Xcode](https://itunes.apple.com/us/app/xcode/id497799835?ls=1&mt=12) with
command line tools
* [XQuartz](https://xquartz.macosforge.org/landing/)

You also need to install the command line tools for Xcode. These can be
installed from the Xcode preferences window.

Homebrew
--------
[Homebrew](http://brew.sh) can be installed by running

`ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"`

in the terminal. Xcode, Git, and their respective command line tools are
required for installing Homebrew. Included in this directory is a Brewfile
that automatically installs a bunch of excellent tools. You can use this file
by running

`brew bundle Brewfile`

Finishing this step basically makes the system fully useable from the command
line. Text editors, productivity apps, and other graphical apps are installed
in the next section.

Boilerplate
-----------
Boilerplate apps are my standard set of apps that I use on every computer.
**Github for Mac** should be installed first, although it's likely you are
already aware of that if you read the sections above.

| Application    | Download From                                                    | Application    | Download From                                                    |
|----------------|:----------------------------------------------------------------:|----------------|:----------------------------------------------------------------:|
| 1Password 4    | [Website      ](https://agilebits.com/onepassword)               | Skim           | [Website      ](http://skim-app.sourceforge.net)                 |
| Sublime Text 3 | [Website      ](http://www.sublimetext.com)                      | Zotero         | [Website      ](https://www.zotero.org)                          |
| iTerm 2        | [Website      ](http://www.iterm2.com/)                          | Dropbox        | [Website      ](https://www.dropbox.com)                         |
| Github for Mac | [Website      ](https://mac.github.com)                          | Daisydisk      | [Mac App Store](http://www.daisydiskapp.com)                     |
| PCalc 4        | [Mac App Store](http://www.pcalc.com)                            | Keka           | [Website      ](http://www.kekaosx.com/en/)                      |
| Evernote       | [Mac App Store](http://evernote.com/evernote/)                   | AppDelete      | [Website      ](http://www.reggieashworth.com/appdelete)         |
| Fantastical    | [Website      ](https://flexibits.com/fantastical)               | R-Name         | [Website      ](https://www.macupdate.com/app/mac/12259/r-name)  |
| Ulysses III    | [Mac App Store](http://www.ulyssesapp.com)                       | VLC            | [Website      ](http://www.videolan.org/vlc/index.html)          |
| Mindnode Pro   | [Mac App Store](https://mindnode.com)                            | Firefox        | [Website      ](http://www.mozilla.org/en-US/firefox/new/)       |

Command Line
------------
These apps are only used in the terminal. This list does not include Homebrew
or programs installed with Homebrew. Read the preceeding section for more info
on that. 

* [Anaconda](https://store.continuum.io/cshop/anaconda/)
* [pdftk](http://www.pdflabs.com/tools/pdftk-server/)

Sublime Text has a command line interface called `subl`. You can use this from
the command line by symlinking as follows:

`ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl`

You can then run `subl` from the terminal to open or create a file.

MacTeX
------
I typically install the full [MacTeX distribution](http://tug.org/mactex/) on
all my computers. This can be skipped if you aren't planning on using LaTeX.
It is a big (and often slow) download.
Awesome applications for vanilla OS X installs
==============================================

This is a list of applications that I install on every Mac that I use. They
can be installed in any order unless explictely stated otherwise.

Utilities
---------
These are required installs for any kind of dev work. They should be 
installed in order:

1. [Xcode](https://itunes.apple.com/us/app/xcode/id497799835?ls=1&mt=12)
2. [XQuartz](https://xquartz.macosforge.org/landing/)

Command Line
------------
These apps are only used in the terminal. Not included are programs installed
with Homebrew -- you can look at the seperate brew file in this repo for that.
**Homebrew** should be installed first.

* [Homebrew](http://brew.sh)
* [Anaconda](https://store.continuum.io/cshop/anaconda/)
* [pdftk](http://www.pdflabs.com/tools/pdftk-server/)

Sublime Text has a command line interface called `subl`. You can use this from
the command line by symlinking as follows:

`ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl`

You can then run `subl` from the terminal to open or create a file.

Boilerplate
-----------
Boilerplate apps are my standard set of apps that I use on every computer.
**Github for Mac** should be installed first, although it's likely you are
already aware of that it since you are viewing this document.

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


MacTeX
------
I typically install the full [MacTeX distribution](http://tug.org/mactex/) on all my computers. This can
be skipped if you aren't planning on using LaTeX. It is a big (and often slow) download.

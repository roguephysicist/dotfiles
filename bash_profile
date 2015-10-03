##### Exports #####
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"' # sets tab and window titles
export PS1="\[\033[38;5;160m\][\h]\[$(tput sgr0)\]\[\033[38;5;15m\] \\$\[$(tput sgr0)\] "
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR="vim"
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"
export MANPAGER="less -X"
export GNUTERM=wxt
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export GREP_OPTIONS='--color=auto'


##### Aliases #####
alias ls='ls -h --color=auto'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.
alias ll="ls -lv --group-directories-first"
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.
alias df='df -H'
alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...
alias brewc='brew cleanup'
alias brewC='brew cleanup --force'
alias brewi='brew install'
alias brewl='brew list'
alias brews='brew search'
alias brewu='brew upgrade'
alias brewU='brew update && brew upgrade'
alias brewx='brew remove'


##### Extra sourcing #####
if [[ `uname` == Darwin ]]; then
    source "$(brew --prefix)/etc/grc.bashrc"        ## Generic Colorizer
    source "$(brew --prefix)/etc/profile.d/z.sh"    ## Z - Directory access via frecency
    source "$(brew --prefix)/etc/bash_completion"   ## Bash autocompletion
fi


##### Paths #####
if [[ `uname` == Darwin ]]; then
    export PATH=/usr/local/bin:$PATH ## Homebrew (already included in prezto)
    export PATH=/opt/X11/bin:$PATH   ## XQuartz (already included in prezto)
    export PATH=/usr/texbin:$PATH    ## MacTex (already included in prezto)
    export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH ## Homebrew GNU Coreutils
    export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH
elif [[ `hostname` == medusa || `hostname` == hexa* || `hostname` == quad* ]]; then ## Paths for medusa
    export TINIBA=$HOME/tiniba/
    export PATH="$TINIBA/clustering/itaxeo:$TINIBA/utils:$PATH"
    export PATH="$HOME/bin/bin:$PATH"
fi


##### Functions #####
## gitignore.io - generates awesome gitignores with gi command
function gi() {
    curl -L -s https://www.gitignore.io/api/$@ ;
}

## plotex - for creating plots in pdf from gnuplot epslatex files
function plotex() {
    local tex=`grep "set output" $1 | grep -v '\#' | awk -F\" '{print $(NF-1)}'`
    local name=`basename $tex .tex`
    gnuplot $1
    epstopdf $name-inc.eps
    pdflatex $tex
    rm -f $name-inc.eps
    rm -f $name-inc.pdf
    rm -f $name.aux
    rm -f $name.log
    rm -f $tex
    clear
}

## secret - for mounting encrypted drives via the command line
function secret() {
    hdiutil attach $1 -stdinpass
}

## Syncs Brew packages with Dropbox
function brewS() {
    local BREW="/usr/local/bin/brew"
    
    # first get local settings
    echo "Reading local settings ..."
    rm -f /tmp/brew-sync.*
    $BREW tap > /tmp/brew-sync.taps
    $BREW list > /tmp/brew-sync.installed
    
    # then combine it with list in Dropbox
    echo "Reading settings from Dropbox ..."
    [ -e ~/Dropbox/Apps/Homebrew/brew-sync.taps ] && cat ~/Dropbox/Apps/Homebrew/brew-sync.taps >> /tmp/brew-sync.taps
    [ -e ~/Dropbox/Apps/Homebrew/brew-sync.installed ] && cat ~/Dropbox/Apps/Homebrew/brew-sync.installed >> /tmp/brew-sync.installed
    
    # make the lists unique and sync into Dropbox
    echo "Syncing to Dropbox ..."
    mkdir -p ~/Dropbox/Apps/Homebrew
    cat /tmp/brew-sync.taps | sort | uniq > ~/Dropbox/Apps/Homebrew/brew-sync.taps
    cat /tmp/brew-sync.installed | sort | uniq > ~/Dropbox/Apps/Homebrew/brew-sync.installed
    
    # Set taps
    echo "Enabling taps ..."
    for TAP in `cat ~/Dropbox/Apps/Homebrew/brew-sync.taps`; do
        $BREW tap ${TAP} >/dev/null
    done
    
    # Install missing Homebrew packages
    echo "Install missing packages ..."
    for PACKAGE in `cat ~/Dropbox/Apps/Homebrew/brew-sync.installed`; do
        $BREW list ${PACKAGE} >/dev/null
        [ "$?" != "0" ] && $BREW install ${PACKAGE}
    done
}

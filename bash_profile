##### Exports #####
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"' # sets tab and window titles
export PS1="\[\e[37m\][\[\e[m\]\[\e[37m\]\h\[\e[m\]\[\e[37m\]]\[\e[m\] \[\e[31m\]\W\[\e[m\] \[\e[37m\]\\$\[\e[m\] "
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
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
# export HOMEBREW_CC=gcc-6
# export HOMEBREW_CXX=g++-6

##### Extra sourcing #####
[ -f /usr/local/etc/profile.d/z.sh ] && . /usr/local/etc/profile.d/z.sh
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

##### Aliases #####
alias ls='ls -h --color=auto'
alias ll='ls -lv --color=auto'
alias lr='ll -R'           # Recursive ls.
alias la='ll -A'           # Show hidden files.
alias df='df -H'           # df with human readable sizes
alias tree='tree -Csuh'    # Nice alternative to 'recursive ls' ...
## brew aliases (mac only)
alias brewc='brew cleanup'
alias brewC='brew cleanup --force'
alias brewi='brew install'
alias brewl='brew list'
alias brews='brew search'
alias brewu='brew upgrade'
alias brewU='brew update && brew upgrade'
alias brewx='brew remove'


##### Paths #####
if [[ `uname` == Darwin ]]; then
    export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH" # coreutils
    export PATH="/Users/sma/anaconda3/bin:$PATH" # Anaconda Python 3.6
    export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH" # coreutils
    #export PATH="/usr/local/opt/python3/bin:$PATH" # brew Python 3
    :
elif [[ `hostname` == fat* || `hostname` == medusa || `hostname` == hexa* || `hostname` == quad* ]]; then ## Paths for medusa
    #export PATH="/opt/science/intelpython3/bin:$PATH" # Intel Python 3.6
    export PATH="/opt/science/anaconda3/bin:$PATH" # Anaconda Python 3.6
    export PATH="/opt/science/bin/abinit-8.8.1-intel16.2.181-MPI/bin:$PATH"
    export TINIBA=$HOME/tiniba/
    export PATH="$TINIBA/clustering/itaxeo:$TINIBA/utils:$PATH"
fi


##### Functions #####
## gitignore.io - generates awesome gitignores with gi command
function gi() {
    curl -L -s https://www.gitignore.io/api/$@ ;
}

## plotex - for creating plots in pdf from gnuplot epslatex files
function plotex() {
    local tex=(`grep "set output" $1 | grep -v '\#' | awk -F\' '{print $(NF-1)}'`)
    gnuplot $1
    for file in ${tex[@]}; do
        local name=`basename $file .tex`
        epstopdf $name-inc.eps
        pdflatex -interaction=batchmode $file
        rm -f $name-inc.eps
        rm -f $name-inc.pdf
        rm -f $name.aux
        rm -f $name.log
        rm -f $file
    done
}

## secret - for mounting encrypted drives via the command line
function secret() {
    hdiutil attach $1 -stdinpass
}

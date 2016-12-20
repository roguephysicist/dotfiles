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


##### Extra sourcing #####
if [[ `uname` == Darwin ]]; then
    source "/usr/local/etc/grc.bashrc"        ## Generic Colorizer
    source "/usr/local/etc/profile.d/z.sh"    ## Z - Directory access via frecency
    source "/usr/local/etc/bash_completion"   ## Bash autocompletion
fi


##### Aliases #####
alias ls='ls -h'
alias ll="ls -lv"
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.
if [[ `uname` == Darwin ]]; then
    alias df='colourify df -H'
    alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...
    alias brewc='brew cleanup'
    alias brewC='brew cleanup --force'
    alias brewi='brew install'
    alias brewl='brew list'
    alias brews='brew search'
    alias brewu='brew upgrade'
    alias brewU='brew update && brew upgrade'
    alias brewx='brew remove'
elif [[ `hostname` == medusa || `hostname` == hexa* || `hostname` == quad* || `hostname` == fat* ]]; then ## Paths for medusa
    alias df='df -H'
fi


##### Paths #####
if [[ `uname` == Darwin ]]; then
    export PATH=/usr/local/bin:$PATH ## Homebrew (already included in prezto)
    export PATH=/opt/X11/bin:$PATH   ## XQuartz (already included in prezto)
    export PATH=/usr/texbin:$PATH    ## MacTex (already included in prezto)
    # export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH ## Homebrew GNU Coreutils
    # export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH
elif [[ `hostname` == fat* || `hostname` == medusa || `hostname` == hexa* || `hostname` == quad* ]]; then ## Paths for medusa
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
        pdflatex $file
        rm -f $name-inc.eps
        rm -f $name-inc.pdf
        rm -f $name.aux
        rm -f $name.log
        rm -f $file
    done
    clear
}

## secret - for mounting encrypted drives via the command line
function secret() {
    hdiutil attach $1 -stdinpass
}

# added by Anaconda3 4.2.0 installer
export PATH="/Users/sma/anaconda/bin:$PATH"

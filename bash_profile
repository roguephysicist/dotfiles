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
export GNUTERM="wxt noraise"
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad


##### Paths #####
if [[ $HOSTNAME == silverhold || $HOSTNAME == aesir ]]; then
    export PATH="$HOME/anaconda3/bin:$PATH" # Anaconda Python 3.6
    export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
    [ -f /opt/local/etc/profile.d/z.sh ] && . /opt/local/etc/profile.d/z.sh
    [ -f /opt/local/etc/profile.d/bash_completion.sh ] && . /opt/local/etc/profile.d/bash_completion.sh
    alias ls='ls -G'
elif [[ $HOSTNAME == hydra || $HOSTNAME == coldstone ]]; then
    export PATH="$HOME/anaconda3/bin:$PATH" # Anaconda Python 3.6
    [ -f /etc/bash_completion ] && . /etc/bash_completion
    alias ls='ls --color'
elif [[ $HOSTNAME == fat* || $HOSTNAME == medusa || $HOSTNAME == hexa* ]]; then ## Paths for medusa
    #export PATH="/opt/science/anaconda3/bin:$PATH" # Anaconda Python 3.6
    export PATH="/opt/science/bin/abinit-8.8.1-intel16.2.181-MPI/bin:$PATH"
    export TINIBA=$HOME/tiniba/
    export PATH="$TINIBA/clustering/itaxeo:$TINIBA/utils:$PATH"
    alias ls='ls --color'
fi


##### Aliases #####
alias ll='ls -lha'
alias df='df -H'           # df with human readable sizes
alias tree='tree -Csuh'    # Nice alternative to 'recursive ls' ...


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

## secret - for mounting encrypted drives via the command line (mac only)
function secret() {
    hdiutil attach $1 -stdinpass
}

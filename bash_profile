##### Exports #####
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"' # sets tab and window titles
export PS1="\[\e[37m\][\[\e[m\]\[\e[37m\]\h\[\e[m\]\[\e[37m\]]\[\e[m\] \[\e[31m\]\W\[\e[m\] \[\e[37m\]\\$\[\e[m\] "

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

export MANPAGER="less -X"
export EDITOR="vim"
export GNUTERM="wxt noraise"


##### Paths #####
if [[ $HOSTNAME == aesir.local ]]; then
    export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
    [ -f /opt/local/etc/profile.d/z.sh ] && . /opt/local/etc/profile.d/z.sh
    [ -f /opt/local/etc/profile.d/bash_completion.sh ] && . /opt/local/etc/profile.d/bash_completion.sh
    alias ls='ls -G'
elif [[ $HOSTNAME == hydra || $HOSTNAME == coldstone || $HOSTNAME == zarathustra ]]; then
    [ -f /etc/bash_completion ] && . /etc/bash_completion
    alias ls='ls --color'
elif [[ $HOSTNAME == fat* || $HOSTNAME == medusa || $HOSTNAME == hexa* ]]; then ## Paths for medusa
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

## plotex - for creating plots in pdf from gnuplot epslatex files
function plotex() {
    gnuplot $1
    for f in $(awk -F\' '/set output/ && /^[^#]/{print $2}' $1); do
        local name=$(basename $f .tex)
        epstopdf $name-inc.eps
        pdflatex -interaction=batchmode $f
        rm -f $name{-inc.eps,-inc.pdf,.aux,.log} $f
    done
}

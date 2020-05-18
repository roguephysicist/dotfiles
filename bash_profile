##### Exports #####
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"' # sets tab and window titles
export PS1="\[\e[37m\][\[\e[m\]\[\e[34m\]\u\[\e[m\]@\[\e[37m\]\h\[\e[m\]\[\e[37m\]]\[\e[m\] \[\e[31m\]\W\[\e[m\] \[\e[37m\]\\$\[\e[m\] "

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

export MANPAGER="less -X"
export EDITOR="vim"
export GNUTERM="wxt"

##### Paths #####
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    [ -f /etc/profile.d/bash_completion.sh ] && . /etc/profile.d/bash_completion.sh
    alias ls='ls --color'
elif [[ "$OSTYPE" == "darwin"* ]]; then
if type brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [[ -r "$COMPLETION" ]] && source "$COMPLETION"
    done
  fi
fi
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
#alias ls='ls -G'
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

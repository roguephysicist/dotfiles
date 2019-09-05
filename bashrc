# Source .bash_profile
if [ -f $HOME/.bash_profile ]; then
   source $HOME/.bash_profile
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/sma/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/sma/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/sma/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/sma/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


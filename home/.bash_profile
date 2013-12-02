export CLICOLOR=1
export GREP_OPTIONS='--color=auto'
export LSCOLORS=Exfxcxdxbxegedabagacad
export GNUTERM=wxt
#export PATH=/Users/sma/dev/scripts:$PATH
source "`brew --prefix grc`/etc/grc.bashrc"

# for homewbrew
export PATH=/usr/local/bin:$PATH

if [ -f $(brew --prefix)/etc/bash_completion ]; then
 . $(brew --prefix)/etc/bash_completion
fi

# added by Anaconda 1.5.1 installer
export PATH="/Users/sma/anaconda/bin:$PATH"

alias plotex="CASE=`basename $1 .gp`; gnuplot $1; epstopdf $CASE-inc.eps; pdflatex $CASE.tex; rm $CASE-inc.eps; rm $CASE-inc.pdf; rm $CASE.aux; rm $CASE.log; rm $CASE.tex; clear"
alias medumount="sshfs medusa:/home/sma /Users/sma/sshfs/medusa/home/sma; sshfs medusa:/homee/sma /Users/sma/sshfs/medusa/homee/sma; sshfs medusa:/homeib/sma /Users/sma/sshfs/medusa/homeib/sma"
alias namback="rsync -az --progress --exclude-from '.rsync_exclude' Documents namira:backup/;\
	rsync -az --progress --exclude-from '.rsync_exclude' Games namira:backup/;\
	rsync -az --progress --exclude-from '.rsync_exclude' Movies namira:backup/;\
	rsync -az --progress --exclude-from '.rsync_exclude' Music namira:backup/;\
	rsync -az --progress --exclude-from '.rsync_exclude' Parallels namira:backup/;\
	rsync -az --progress --exclude-from '.rsync_exclude' Pictures namira:backup/;\
	rsync -az --progress --exclude-from '.rsync_exclude' dev namira:backup/"

#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

##### Extra Sourcing #####

if [[ `uname` == Darwin ]]; then
    source "/usr/local/etc/grc.bashrc"     ## Generic Colorizer
    source "/usr/local/etc/profile.d/z.sh" ## Z - Directory access via frecency
fi

##### Paths #####

## Paths for OS X
if [[ `uname` == Darwin ]]; then
    # export PATH=/usr/local/bin:$PATH ## Homebrew (already included in prezto)
    # export PATH=/opt/X11/bin:$PATH   ## XQuartz (already included in prezto)
    # export PATH=/usr/texbin:$PATH    ## MacTex (already included in prezto)
    export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH ## Homebrew GNU Coreutils
    export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH
elif [[ `hostname` == medusa || `hostname` == hexa* || `hostname` == quad* ]]; then ## Paths for medusa
    # TINIBA
    export TINIBA=$HOME/tiniba/
    export PATH="$TINIBA/clustering/itaxeo:$TINIBA/utils:.:$PATH"
    # My binaries
    export PATH="$HOME/bin/bin:$PATH"
    # FPATH for Intel Fortran compiler
    #export FPATH="/home/sma/.zprezto/modules/helper/functions:/home/sma/.zprezto/modules/completion/external/src:/home/sma/.zprezto/modules/utility/functions:/home/sma/.zprezto/modules/git/functions:/home/sma/.zprezto/modules/prompt/functions:/opt/intel/composer_xe_2011_sp1.6.233/mkl/include:/usr/local/share/zsh/site-functions:/usr/local/share/zsh/5.0.6/functions"
fi

## Anaconda Python Distribution
#export PATH=$HOME/anaconda/bin:$PATH

##### Exports #####

## Highlight section titles in manual pages
export LESS_TERMCAP_md="$ORANGE"
## Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"
## Link Homebrew casks in `/Applications` rather than `~/Applications`
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
## Sets default terminal for Gnuplot to "wxt"
export GNUTERM=wxt

##### Aliases #####

## for aliasing hub to git
#eval "$(hub alias -s)"

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
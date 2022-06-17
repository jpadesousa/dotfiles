# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Prompt options
PROMPT_DIRTRIM=3
PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "

# Environment variables
export http_proxy=http://proxy.ethz.ch:3128
export https_proxy=http://proxy.ethz.ch:3128
export NXF_OPTS='-Xms1g -Xmx4g'
export PUBLIC="/home/josousa/public/"


# Aliases
alias dumax1="du -xh --max-depth=1"
alias ll="ls -lhtr --color=auto"
alias lla="ls -lhatr --color=auto"
alias lld='ls -ltr | grep ^d' # List directories only
alias untar='tar -xvzf' # Easy untar

# Safety
alias rm="rm -i"
alias mv='mv -i'
alias cp='cp -i'

# Bash history stuff
export HISTCONTROL=ignoreboth
export HISTFILESIZE=10000000
export HISTSIZE=10000000
export HISTIGNORE='&:ls:l:la:ll:exit'

# One command to extract them all
extract () {
  if [ $# -ne 1 ]
  then
    echo "Error: No file specified."
    return 1
  fi
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2) tar xvjf $1   ;;
      *.tar.gz)  tar xvzf $1   ;;
      *.bz2)     bunzip2 $1    ;;
      *.rar)     unrar x $1    ;;
      *.gz)      gunzip $1     ;;
      *.tar)     tar xvf $1    ;;
      *.tbz2)    tar xvjf $1   ;;
      *.tgz)     tar xvzf $1   ;;
      *.zip)     unzip $1      ;;
      *.Z)       uncompress $1 ;;
      *.7z)      7z x $1       ;;
      *)         echo "'$1' cannot be extracted via extract" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

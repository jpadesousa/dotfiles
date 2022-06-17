# .zshrc
# Source global definitions
if [ -f /etc/zshrc ]; then
	. /etc/zshrc
fi

# Variables
export PATH=/Users/josousa/Library/Python/3.8/bin:$PATH
export EULER_SSH_KEY=$HOME/.ssh/eth_euler

# Prompt options
PROMPT_DIRTRIM=3
PROMPT="%F{red}%n%f@%F{green}${${(%):-%m}#zoltan-}%f %F{yellow}%1~ %F{white}"

# Aliases
alias ll="ls -lhtr"
alias lla="ls -lhatr"
alias lsd='ls -l | grep ^d' # List directories only
alias untar='tar -xvzf'     # Easy untar
alias start_vscode='curl -s -o ~/Downloads/start_vscode.sh https://raw.githubusercontent.com/vonMeyennLab/scripts/main/start_vscode.sh; chmod u+x ~/Downloads/start_vscode.sh; bash ~/Downloads/start_vscode.sh'
alias list_tunnels='ps aux | grep -- "-L" | grep -- "-N"'
alias nme_vm_rstudio='ssh -f -N -L 8888:localhost:8787 josousa@g-wst-nme-seq.ethz.ch & open -a "Brave Browser" http://localhost:8888/'
alias nme_vm2_rstudio='ssh -f -N -L 8889:localhost:8787 josousa@g-wst-nme-seq2.ethz.ch & open -a "Brave Browser" http://localhost:8889/'
alias r="radian"

# Safety
alias rm="rm -i"
alias mv='mv -i'
alias cp='cp -i'

# Bash history stuff
export HISTCONTROL=ignoreboth
export HISTFILESIZE=10000000
export HISTSIZE=10000000
export HISTIGNORE='&:ls:l:la:ll:exit'

# Nice colours in the terminal for OSX
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Grep options
export GREP_OPTIONS='--color'
export GREP_COLOR='1;31' # green for matches

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

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# flounder .bashrc
 
# Mac OS X + Homebrew bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
   . $(brew --prefix)/etc/bash_completion
fi
    
# Mac OS X + Homebrew, use GNU coreutils, sed, and find with their real names for path and manpath
# NB: You might run into some Mac OS X compat issues doing this. As of now, I haven't
#     hit anything bad yet and the benefits outweigh the disadvantages for me.
#     If you use the Mac OS X postgres install scripts for quickstart you might need 
#     to do sed -i 's|sed|/usr/bin/sed|g' based on your configuration
#     in order to explicitly reference the BSD version of sed.
export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/gnu-sed/bin:/usr/local/opt/findutils/bin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export JAVA_HOME='/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home'
export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)

export PYTHONPATH=$PYTHONPATH:/Users/cmartin/pytable/src/main/python

export SCALA_HOME="/Users/cmartin/scala-2.11.2"
export PATH=$PATH:$SCALA_HOME/bin

#export PATH="$HOME/.node/bin:$HOME/.node/bin/npm:$PATH"
#setjdk() {
#  export JAVA_HOME=$(/usr/libexec/java_home -v $1)
#}


function setjdk() {
  if [ $# -ne 0 ]; then
    removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
    if [ -n "${JAVA_HOME+x}" ]; then
      removeFromPath $JAVA_HOME
    fi
    export JAVA_HOME=`/usr/libexec/java_home -v $@`
    export PATH=$JAVA_HOME/bin:$PATH
  fi
}

function removeFromPath() {
  export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
}
setjdk 1.7

 # aliasble color support for grep
 alias grep='grep --color=auto'
 alias fgrep='fgrep --color=auto'
 alias egrep='egrep --color=auto'
  
# some ls aliases
#alias ls='ls --color=auto' # color, the GNU way. The BSD way (non-GNU coreutils) is 'ls -G'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias sl='ls' # because I commonly type sl (and don't want a steam locomotive)
 
# git aliases
alias hlog='git log --date-order --all --graph --format="%C(green)%h %Creset%C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset %s"'
alias gits='git status'
alias gitb='git branch'

# tmux aliases
alias tmux="TERM=screen-256color-bce tmux" # specifically for 256color compat in tmux + iterm
#alias screen="TERM=screen-256color-bce screen" # specifically for 256color compat in tmux + iterm   
# misc aliases
alias info='info --vi-keys'
# override tilde expansion in bash_completion because I hate it
_expand()
{
  return 0;
}

# move up directories quickly
up ()
{
  [ "$#" -eq 1 -a "$1" -gt 0 ] || { echo 'Usage: up <number of directories up>'; return 1; }
  up=""
  for (( i = 1; i <= $1; i++));
  do 
    up="$up../"
  done
  cd $up
}

# define colors
#C_DEFAULT="\[\033[m\]"
#C_RED="\[\033[31m\]"
#C_GREEN="\[\033[32m\]"
#C_YELLOW="\[\033[33m\]"
#C_BLUE="\[\033[34m\]"
#C_PURPLE="\[\033[35m\]"
#C_CYAN="\[\033[36m\]"
#C_LIGHTGRAY="\[\033[37m\]"
#C_DARKGRAY="\[\033[1;30m\]"
#C_LIGHTRED="\[\033[1;31m\]"
#C_LIGHTGREEN="\[\033[1;32m\]"
#C_LIGHTYELLOW="\[\033[1;33m\]"
#C_LIGHTBLUE="\[\033[1;34m\]"
#C_LIGHTPURPLE="\[\033[1;35m\]"
#C_LIGHTCYAN="\[\033[1;36m\]"
#C_BG_BLACK="\[\033[40m\]"
#C_BG_RED="\[\033[41m\]"
#C_BG_GREEN="\[\033[42m\]"
#C_BG_YELLOW="\[\033[43m\]"
#C_BG_BLUE="\[\033[44m\]"
#C_BG_PURPLE="\[\033[45m\]"
#C_BG_CYAN="\[\033[46m\]"
#C_BG_LIGHTGRAY="\[\033[47m\]"

# Set the prompt to be short and sweet
#export PS1="$C_LIGHTBLUE\u$C_LIGHTBLUE@$C_BLUE\h$C_RED:$C_LIGHTGREEN\$PWD $C_RED\$$C_DEFAULT "

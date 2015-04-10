if [ -f /etc/bash_completion ]; then
	    . /etc/bash_completion
fi


#   ------------------------------------
#   2.   MAKE TERMINAL BETTER
#   ------------------------------------

#privileged access
if [ $UID -ne 0 ]; then
    alias sudo='sudo '
    alias scat='sudo cat'
    alias svim='sudo vim'
    alias root='sudo su'
    alias reboot='sudo reboot'
    alias halt='sudo halt'
fi

#file manipulation
alias cp='cp -v'                         # verbose copy
#alias cp="cp -i"                        # confirm before overwriting something
alias mv='mv -v'                         # verbose copy
#alias mv="mv -i"                        # confirm before overwriting something

#visual help
alias grep='grep --color=tty -d skip'    # colored grep
alias less='less -FSRXc'                 # better less
alias c='clear'                          # clear screen

#ls help
alias ls='ls --color=auto'
alias lr='ls -R'                         # recursive list
alias ll='ls -l'                         # long listing format
alias la='ls -a'                         # list all
alias lla='ls -la'                       # long listing format with all
alias lx='ll -BX'                        # sort by extension
alias lz='ll -rS'                        # sort by size
alias lt='ll -rt'                        # sort by date
alias lm='la | more'                     # list pipe to  more tool

#navigation help
alias cd..='cd ../'                      # go back 1 directory level (for fast typers :) )
alias ..='cd ../'                        # go back 1 directory level
alias ...='cd ../../'                    # go back 2 directory level
alias .3='cd ../../../'                  # go back 3 directory level
alias .4='cd ../../../../'               # go back 4 directory level
alias .5='cd ../../../../../'            # go back 5 directory level
alias .6='cd ../../../../../../'         # go back 6 directory level

#extra
alias df='df -h'                         # human-readable sizes
alias free='free -m'                     # show sizes in MB
alias path='echo -e ${PATH//:/\\n}'      # echo all paths

#sudo tab completion
complete -cf sudo
complete -cf man

#history completion
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

#   ------------------------------------
#   3.  PACMAN - ARCH ONLY
#   ------------------------------------

alias pac="sudo pacman -S"              # default action - install one or more packages
alias pacu="sudo pacman -Syu"           # update - upgrade all packages to their newest version
alias pacr="sudo pacman -Rs"            # remove - uninstall one or more packages
alias pacs="pacman -Ss"                 # search - search for a package using one or more keywords
alias paci="pacman -Si"                 # info - show information about a package
alias paclo="pacman -Qdt"               # list orphans - list all packages which are orphaned
alias pacc="sudo pacman -Scc"           # clean cache - delete all not currently installed package files
alias paclf="pacman -Ql"                # list files - list all files installed by a given package
alias pacexpl="pacman -D --asexp"       # explicit - mark one or more packages as explicitly installed
alias pacimpl="pacman -D --asdep"       # implicit - mark one or more packages as non explicitly installed



#   ------------------------------------
#   4.  NETWORKING 
#   ------------------------------------

alias myip='curl ip.wayfaringwindsor.com'     # public facing ip address
alias net-connections='lsof -i'               # show all open tcp/ip sockets
alias lsock='sudo lsof -i -P'                 # show open sockets
alias lsock-tcp='sudo lsof -i -nP | grep TCP' # show open tcp sockets
alias lsock-udp='sudo lsof -i -nP | grep UDP' # show open udp sockets
alias open-ports='sudo lsof -i | grep LISTEN' # show open ports

info()
{
  echo -e "\nYou are loged on ${RED}$HOST"
  echo -e "\nAdditional infomation: $NC " ; uname -a
  echo -e "\n${RED}Users logged on:$NC " ; w -h
  echo -e "\n${RED}Current data:$NC " ; date 
  echo -e "\n${RED}Machine stats:$NC " ; uptime 
}

# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#Git helper
gitInfo()
{
  GIT_ST=$(git status 2>&1)
  
  if [ $? -ne 0 ]; then
    return
  fi

  echo -e "$(__git_ps1" <\e[${TEXE_COLOR}m%s${SIGIL}\e[0m>")"
}

# prompt
#PS1='[\u@\h \W]\$ '

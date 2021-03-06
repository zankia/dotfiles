# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# For termite new terminal opening
if [[ -e /etc/profile.d/vte.sh ]]; then
  source /etc/profile.d/vte.sh
fi


# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' menu select
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/zankia/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.history
HISTSIZE=1000
SAVEHIST=10000
unsetopt append_history
unsetopt inc_append_history
setopt auto_cd
setopt dvorak
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt menu_complete
setopt share_history
bindkey -v
# End of lines configured by zsh-newuser-install

export PATH=$PATH:~/bin

# Prompt appearance
PROMPT="%F{green}%n@%m%f:%F{blue}%1~%f%# "
RPROMPT="%(?.%F{green}✓.%F{red}?%?)%f %*"

# archive extractor
ex () {
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

# color aliases
if [ -x /usr/bin/dircolors ]; then
  eval "$(dircolors -b)"
fi
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Human readable
alias df="df -h"

# less syntax highlight
alias lessh="/usr/share/vim/vim82/macros/less.sh"

# cal more compliant
alias cal="cal -y"

# some more ls aliases
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands. Use like so: `sleep 10; alert`
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

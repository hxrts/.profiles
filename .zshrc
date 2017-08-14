# zsh login instances


#-----------------
# TRAMP prompt fix
#-----------------

[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return

#---------
# zsh init
#---------

# path to oh-my-zsh installation
export ZSH=~/.oh-my-zsh

# always auto-update
DISABLE_UPDATE_PROMPT=true

# theme
ZSH_THEME="refined"


#--------
# options
#--------

# ...
COMPLETION_WAITING_DOTS='true'

# history
HIST_STAMPS="dd.mm.yyyy"


#----------
# oh my zsh
#----------

# plugins found in ~/.oh-my-zsh/plugins/  +  ~/.oh-my-zsh/custom/plugins/
plugins=(osx jsontools vi-mode tmux git git-extras z man colorize colored-man-pages docker rsync brew npm lein)

source $ZSH/oh-my-zsh.sh

. ~/.oh-my-zsh/plugins/z/z.sh


#------
# emacs
#------

# color settings
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color


#---------
# profiles
#---------

if [ -f ~/.profile ]; then
   source ~/.profile
fi

if [ -f ~/.local_profile ]; then
   source ~/.local_profile
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

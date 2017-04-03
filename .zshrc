
#-----
# PATH
#-----

export PATH=$PATH:$HOME/bin:/usr/local/bin


#----
# ZSH
#----

# path to oh-my-zsh installation
export ZSH=/Users/hxrts/.oh-my-zsh

# operations
ZSH_THEME='pure'

COMPLETION_WAITING_DOTS='true'

HIST_STAMPS="dd.mm.yyyy"

# plugins found in ~/.oh-my-zsh/plugins/  +  ~/.oh-my-zsh/custom/plugins/
plugins=(osx history jsontools vi-mode tmux git git-extras man colorize colored-man-pages docker rsync brew npm lein)

source $ZSH/oh-my-zsh.sh

#------------
# USER CONFIG
#------------

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

export PKG_CONFIG_PATH=/usr/local/Cellar/poppler/0.53.0/lib/pkgconfig:/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig

#------------
# APP ALIASES
#------------

alias ls='ls -aG'
alias spider="(cd /Users/hxrts/projects/arena/spider && sh run.sh)"


#-----------------
# REMOTE LOCATIONS
#-----------------

# msk
alias hal='ssh -i ~/.ssh/id_rsa bermans@hal.cbio.mskcc.org'
alias saba='ssh -i ~/.ssh/saba.private bermans@saba2.cbio.mskcc.org'
alias ika='ssh -i ~/.ssh/saba.private bermans@ika.cbio.mskcc.org'
alias selene='ssh -i ~/.ssh/saba.private bermans@selene.cbio.mskcc.org'
alias unagi='ssh -i ~/.ssh/saba.private bermans@unagi.cbio.mskcc.org'

# hxrts
alias terra='ssh hxrts@terra.hxrts.com'
alias juno='ssh admin@juno.hxrts.com'


#------
# EMACS
#------

# color settings
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color


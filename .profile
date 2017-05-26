# all shell instances

#-----
# path
#-----

# ruby version manager
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # load RVM as function

# miniconda
export PATH="~/miniconda3/bin:$PATH"

# local apps
export PATH="$PATH:$HOME/bin"


#-----------------------
# app aliases & defaults
#-----------------------

editor='vi'

# use nvim
alias vi='nvim -N'
alias vim='nvim -N'

# grep coloring
export GREP_OPTIONS='--color=auto' 

# tree coloring
alias tree="tree -C"


#------------------
# platfom targeting
#------------------

platform='unknown'
unamestr=`uname`

if [[ "$unamestr" == 'Linux' ]]; then
    alias ls="ls -GFha --color"
    eval 'dircolors ~/.profiles/dircolors.256dark' > /dev/null
    export TERM=xterm-256color
    export LS_COLORS
elif [[ "$unamestr" == 'Darwin' ]]; then
    export CLICOLOR=1
    export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
    alias ls='ls -GFha'
fi


#----
# ssh
#----

export SSH_KEY_PATH='~/.ssh/id_rsa'


#-----------------
# remote locations
#-----------------

# hxrts alias
alias terra='ssh hxrts@terra.hxrts.com'
alias juno='ssh admin@juno.hxrts.com'

# lab aliases
alias hal='ssh -i ~/.ssh/id_rsa bermans@hal.cbio.mskcc.org'
alias saba='ssh -i ~/.ssh/saba.private bermans@saba2.cbio.mskcc.org'
alias ika='ssh -i ~/.ssh/saba.private bermans@ika.cbio.mskcc.org'

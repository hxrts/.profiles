# interactive non-login instances

#----------
# bash init
#----------

# if not running interactively, continue
[ -z "$PS1" ] && return

#--------
# options
#--------

# no duplicate lines in history
HISTCONTROL=ignoreboth

# append to history file
shopt -s histappend

# history length
HISTSIZE=1000
HISTFILESIZE=2000

# check window size after commands & update LINES, COLUMNS
shopt -s checkwinsize


#-----------------------
# app aliases & defaults
#-----------------------

# shell vi mode
set -o vi

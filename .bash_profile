#set terminal in vi editing mode
set -o vi

# set vim alias
alias vi='vim -N'  

# sublime text as default prompt text editor
export EDITOR='subl -w' # for sim link info and documentation go here http://www.sublimetext.com/docs/3/osx_command_line.html

# colored ls
platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
  platform='Linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
  platform='Darwin'
fi

if [[ $platform == 'Linux' ]]; then
  alias ls="ls --color"
  eval 'dircolors ~/gitprofiles/dircolors.256dark' > /dev/null
  export TERM=xterm-256color
  export LS_COLORS
elif [[ $platform == 'Darwin' ]]; then
  export CLICOLOR=1
  export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
  alias ls='ls -GFha'
  alias tree="tree -C"
fi

# prompt coloring
parse_git_branch() {
	           git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
		   }
		   export PS1="\[$(tput bold)\]\[$(tput setaf 7)\]\\$ \[$(tput setaf 6)\]\u\[$(tput setaf 7)\] @ \[$(tput setaf 4)\]\h\[$(tput setaf 7)\] : \[$(tput setaf 8)\]\w\[$(tput setaf 9)\]\$(parse_git_branch)\n> \[$(tput sgr0)\]"

# grep coloring
export GREP_OPTIONS='--color=auto' 

# RVM
[[ -s "/Users/bermans/.rvm/scripts/rvm" ]] && source "/Users/bermans/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM
platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
  platform='Linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
  platform='Darwin'
fi

if [[ $platform == 'linux' ]]; then
  alias ls="ls --color"
  eval 'dircolors ~/gitprofiles/dircolors.256dark' > /dev/null
  export TERM=xterm-256color
  export LS_COLORS
elif [[ $platform == 'Darwin' ]]; then
  export CLICOLOR=1
  export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
  alias ls='ls -GFh'
  alias tree="tree -C"
fi

# prompt coloring
parse_git_branch() {
	           git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
		   }

		   export PS1="\[$(tput bold)\]\[$(tput setaf 7)\]\\$ \[$(tput setaf 6)\]\u\[$(tput setaf 7)\] @ \[$(tput setaf 4)\]\h\[$(tput setaf 7)\] : \[$(tput setaf 8)\]\w\[$(tput setaf 9)\]\$(parse_git_branch)\n> \[$(tput sgr0)\]"

# grep coloring
export GREP_OPTIONS='--color=auto'

# paths
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH="$PATH:/bin/gen/samtools-0.1.18:/bin/gen/zlib-1.2.6:/bin/utils/xz-5.0.3"
export PATH="$PATH:/Library/Frameworks/Python.framework/Versions/2.7/bin/python"
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="$PATH:~/bin"
alias vi='vim -N'   

# Setting PATH for Python 2.7
PATH="/Users/bermans/Documents/scripts:/Users/bermans/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

alias getfasta='getfasta.sh'
alias R='x & quartz-wm & R'
export projects="/Volumes/Sol/projects/"
alias hoppserver="ssh 172.21.215.200"
export PATH=/Applications/bowtie2-2.0.0-beta6/:$PATH

# mysql
export PATH="/usr/local/mysql/bin:$PATH"

# pyMol vars
export DISPLAY=":0.0"

# server aliases
alias hopplocal="ssh -l ubuntu 172.21.74.130"
alias localup="VBoxManage startvm hopplocal --type headless"
alias localdown="VBoxManage controlvm hopplocal poweroff"
alias galaxyup="ssh -l ubuntu 172.21.74.43 -f 'sudo sh /home/ubuntu/galaxy-dist/run.sh' >/dev/null 2>&1"
alias killgalaxy='sudo kill -9 $(ps a -e | grep "sh /home/ubuntu/galaxy-dist/run.sh" | head -1 | awk -F" " "{print $1}")'

# RVM
[[ -s "/Users/bermans/.rvm/scripts/rvm" ]] && source "/Users/bermans/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# MacPorts Installer addition on 2012-03-20_at_17:49:44: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# sublime text as default prompt text editor
export EDITOR='subl -w' # for sim link info and documentation go here http://www.sublimetext.com/docs/3/osx_command_line.html

[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM

# Add GHC 7.8.2 to the PATH, via http://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/ghc-7.8.2.app"
if [ -d "$GHC_DOT_APP" ]; then
  export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi
    fi

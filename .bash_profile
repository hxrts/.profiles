# set terminal to vi mode
set -o vi

# set vim alias
alias vi='nvim -N'  

# platform info
platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
    platform='Linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
    platform='Darwin'
fi

# colored ls
if [[ $platform == 'Linux' ]]; then
    alias ls="ls -a --color"
    eval 'dircolors ~/profiles/dircolors.256dark' > /dev/null
    export TERM=xterm-256color
    export LS_COLORS
elif [[ $platform == 'Darwin' ]]; then
    export CLICOLOR=1
    export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
    alias ls='ls -GFha'
    alias tree="tree -C"
fi

# git session status
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# session coloring
export PS1="\[$(tput bold)\]\[$(tput setaf 7)\]\\$ \[$(tput setaf 6)\]\u\[$(tput setaf 7)\] @ \[$(tput setaf 4)\]\h\[$(tput setaf 7)\] ◷ \[$(tput setaf 10)\]\D{%F %T}\[$(tput setaf 7)\] : \[$(tput setaf 10)\]\w\[$(tput setaf 9)\]\$(parse_git_branch)\n> \[$(tput sgr0)\]"

# grep coloring
export GREP_OPTIONS='--color=auto' 

# rsync params
alias rsync='rsync -rzvPh'

# command log command
if [[ "$unamestr" == 'Linux' ]]; then
    editor='vi'
elif [[ "$unamestr" == 'Darwin' ]]; then
    editor="subl"
fi

# captain's log
alias log='$editor ~/log.md'

# locations
alias terra='ssh hxrts@terra.hxrts.com' # 104.236.26.234
alias juno='ssh admin@juno.hxrts.com' # 74.66.134.22

# formats history timestamping, call by using command 'history'
export HISTTIMEFORMAT="%d/%m/%y %T "

# source shared tmux configuration
tmux source-file ~/profiles/.tmux.conf > /dev/null 2>&1

smartresize() {
	mogrify -path $3 -filter Triangle -define filter:support=2 -thumbnail $2 -unsharp 0.25x0.08+8.3+0.045 -dither None -posterize 136 -quality 82 -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB $1
	}

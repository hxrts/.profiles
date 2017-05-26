# bash login instances

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

if [ -f ~/.profile ]; then
   source ~/.profile
fi

if [ -f ~/.local_profile ]; then
   source ~/.local_profile
fi

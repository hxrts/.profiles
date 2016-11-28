#-----
# bash
#-----

echo 'source ~/profiles/.bash_profile' >> ~/.bash_profile

echo 'source ~/profiles/.bashrc' >> ~/.bashrc


#----
# git
#----

printf '[include]\n\tpath = profiles/.gitconfig' >> ~/.gitconfig


#----
# vim
#----

mkdir -p ~/.vim/backup

echo ':so ~/profiles/.vimrc' >> ~/.vimrc

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
		curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

mkdir -p ~/.vim/bundle
git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized


#--
# R
#--

echo 'source("~/profiles/.Rprofile")' >> ~/.Rprofile


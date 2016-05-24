#! /bin/bash

#--------------------
# add source function
#--------------------

add_source() {

	source_cmd=$1
	profile=$2

	if [ -e "$profile" ] ; then
		echo -e "- found" $profile
		if ! grep -qF "$source_cmd" $profile ; then
			echo -e "  adding source cmd\n"
			profile_content=$(cat $profile)
			echo -en "$source_cmd\n$profile_content" > $profile
		else
			echo -e "  source string present\n"
			return 1
		fi
	else
		echo -e "- building" $profile "\n"
		echo -e "$source_cmd" > $profile
	fi
}


#-------
# .bash*
#-------

# .bash_profile
add_source "source $HOME/profiles/.bash_profile" $HOME/.bash_profile

# .bashrc
add_source "source $HOME/profiles/.bashrc" $HOME/.bashrc


#----
# vim
#----

# .vimrc
add_source ":so $HOME/profiles/.vimrc" $HOME/.vimrc

# vim pathogen package manager install & theme
mkdir -p $HOME/.vim/backup $HOME/.vim/autoload $HOME/.vim/bundle && \
curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim && \
if ! [ -e $HOME/.vim/bundle/vim-colors-solarized ] ; then
	git clone git://github.com/altercation/vim-colors-solarized.git $HOME/.vim/bundle/vim-colors-solarized
fi


#--
# R
#--

# .Rprofile
add_source "source(\"$HOME/profiles/.Rprofile\")" $HOME/.Rprofile


#----
# git
#----

# .gitconfig
add_source "	path = profiles/.gitconfig" $HOME/.gitconfig && \
add_source '[include]' $HOME/.gitconfig


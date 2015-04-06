gitprofiles
===========

## notes

for syncing profiles across machines

## instructions
### bash
~/.bash\_profile should source gitprofiles folder with `source /full_path_to/gitProfiles/.bash_profile`

linux boxes can add to ~/.bashrc the following to source gitprofiles folder `source /full_path_to/gitProfiles/.bashrc`

### vim
create directory ~/.vim/backup for vim backups

~/.vimrc should source the gitprofiles folder with `:so ~/gitProfiles/.vimrc`

### R
~/.Rprofile should source the gitprofiles folder with `source("~/gitProfiles/.Rprofile")`

### git
add the following to ~/.gitprofile to source code in gitprofiles/.gitconfig

```
[include]
	path = gitProfiles/.gitconfig
```

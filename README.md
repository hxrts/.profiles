profiles
========

for syncing profile settings across machines

## instructions
### bash
~/.bash\_profile should source profiles folder with `source ~/profiles/.bash_profile`

linux boxes can add to ~/.bashrc the following to source gitprofiles folder `source ~/profiles/.bashrc`

### vim
create directory ~/.vim/backup for vim backups

~/.vimrc should source the gitprofiles folder with `:so ~/profiles/.vimrc`

### R
~/.Rprofile should source the profiles folder with `source("~/profiles/.Rprofile")`

### git
add the following to ~/.gitconfig to source code in profiles/.gitconfig

```
[include]
	path = profiles/.gitconfig
```


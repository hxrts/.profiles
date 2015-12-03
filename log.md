# QSUB

qstat -u "*"

qstat -r -u bermans

<!------------------------------------------------------------------------------------------------------------------------>

# MAKE & PIPELINE

local run flag = ```USE_CLUSTER=false```

## make runtime
make -f = specific file
	 -n = simulate make
	 -d = detailed output

## writing make

### lazy Set

VARIABLE = value
Normal setting of a variable - values within it are recursively expanded when the variable is used, not when it's declared

### immediate Set

VARIABLE := value
Setting of a variable with simple expansion of the values inside - values within it are expanded at declaration time.

### set if absent

VARIABLE ?= value
Setting of a variable only if it doesn't have a value

### append

VARIABLE += value
Appending the supplied value to the existing value (or setting to that value if the variable didn't exist)

<!------------------------------------------------------------------------------------------------------------------------>

# REGEX

## match from 'somestring' to the end of the line

```(somestring.*)$```


## match from the beginning of the line to 'somestring'

```.*(somestring)```


## match between two strings

```
(stringone)(.*)(stringtwo)		# between strings
(?<=stringone)(.*)(?=stringtwo)		# including those strings
```

<!------------------------------------------------------------------------------------------------------------------------>

# System

## find & move files

```find . -name "*.extension" -exec mv {} ../siblingdir \;```

# system processes

```ps -u {username}```
```htop -u {username}```


<!------------------------------------------------------------------------------------------------------------------------>

# R

## exel

```read.xlsx()```
```getSheets()```

<!------------------------------------------------------------------------------------------------------------------------>

# Sublime

## sublime console

```Control + /````

## go to

```cmd + p```

## command palette

```cmd + P```

<!------------------------------------------------------------------------------------------------------------------------>

# less

/ – search for a pattern which will take you to the next occurrence.
? – search for a pattern which will take you to the previous occurrence.
n – next match
N – previous match

CTRL+F – forward one window
CTRL+B – backward one window
CTRL+D – forward half window
CTRL+U – backward half window

v – using the configured editor edit the current file.

:n – go to the next file.
:p – go to the previous file.

<!------------------------------------------------------------------------------------------------------------------------>

# nginx

## nginx setup

### proxy server configuration

```vim /etc/nginx/sites-available/yourdomain```

### enable proxy server configs

```
cd /etc/nginx/sites-enabled/ 
ln -s /etc/nginx/sites-available/yourdomain yourdomain
```

## restart nginx

```service nginx restart```

### test if nginx is running

```ps waux | grep nginx```

### test nginx config

```sudo nginx -t```

<!------------------------------------------------------------------------------------------------------------------------>

# node.js



<!------------------------------------------------------------------------------------------------------------------------>

# GitHub Markdown

[https://help.github.com/articles/markdown-basics/](Markdown Basics)

[https://help.github.com/articles/github-flavored-markdown/](Flavored Markdown)

[http://jbt.github.io/markdown-editor/](GitHub-Flavored Markdown Editor)
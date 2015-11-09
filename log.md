# QSUB

qstat -u "*"

<!------------------------------------------------------------------------------------------------------------------------>

# MAKE 

## make runtime
make -f = specific file
	 -n = simulate make


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

# SYSTEM

# find & move files

```find . -name "*.extension" -exec mv {} ../siblingdir \;```

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

# GitHub Markdown

[https://help.github.com/articles/markdown-basics/](Markdown Basics)

[https://help.github.com/articles/github-flavored-markdown/](Flavored Markdown)

[http://jbt.github.io/markdown-editor/](GitHub-Flavored Markdown Editor)
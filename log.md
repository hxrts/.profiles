## QSUB

qstat -u "*"



## MAKE 

make -f = specific file
	 -n = simulate make



## REGEX

### match from 'somestring' to the end of the line

```(somestring.*)$```


### match from the beginning of the line to 'somestring'

```.*(somestring)```


### match between two strings

```
(stringone)(.*)(stringtwo)		# between strings
(?<=stringone)(.*)(?=stringtwo)		# including those strings
```


## SYSTEM

### find & move files

```find . -name "*.extension" -exec mv {} ../siblingdir \;```



## R

### exel

```read.xlsx()```
```getSheets()```



## Sublime

### sublime console

```Control + /````

### go to

```cmd + p```

### command palette

```cmd + P```



## GitHub Markdown

[https://help.github.com/articles/markdown-basics/](Markdown Basics)

[https://help.github.com/articles/github-flavored-markdown/](Flavored Markdown)

[http://jbt.github.io/markdown-editor/](GitHub-Flavored Markdown Editor)
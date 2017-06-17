#----------------
# startup options
#----------------

options(editor = 'subl')
options(width = 150)
options(menu.graphics = FALSE)


#-----------------------
# initialization options
#-----------------------

.First <- function() {
  options(
    repos = c( CRAN = 'http://cran.rstudio.com/', 'http://cran.r-project.org'),
               browserNLdisabled = TRUE,
               deparse.max.lines = 2 )
}

#--------------
# load packages
#--------------

libs <- function() {

    # masked packages
    suppressPackageStartupMessages(library(plyr))
    suppressPackageStartupMessages(library(data.table))

    # main packages
    pacman::p_load( devtools,                                                         # utils
                    colorout, crayon, colorspace, RColorBrewer,                       # coloring
                    rlist,                                                            # working
                    openxlsx, readr,                                                  # IO
                    ggplot2, grid, gridExtra, scales,                                 # plotting
                    lazyeval, tibble, dplyr, tidyr, magrittr, stringr, purrr, broom,  # dplyr
                    matrixStats)                                                      # matrix manipulation
}


#--------------------
# R environment utils
#--------------------

# turn off graphics
g_off <- function() { graphics.off() }

# define x window
xw <- function(w,h) { x11(width=w, height=h) }

# kill child working processes
kc <- function() {
    kill(children())
    collect()
}

# get last value
lv <- function() .Last.value

# list objects in size order
ll <- function() {
    tmp <- sapply(ls(globalenv()), function(x) object.size(get(x, envir=globalenv())))
    round(sort(tmp)/1024)
}

# refresh R environment
# makeActiveBinding("refresh", function() { system("R"); q("no") }, .GlobalEnv)


#------------------
# working functions
#------------------

# play a sound
Notify <- function() { system('afplay /System/Library/Sounds/Hero.aiff') }

# more sensible rounding
n_round <- function(x){ trunc(x+0.5) }

# make multiple directories at once
MakeDirs <- function(dir.list, debug=TRUE) {
    dir.list %>% list.map({
        dir <- .
        if(debug){ message(blue(str_c('- making directory: ', dir))) }
        dir.create(dir, recursive=TRUE, showWarnings=FALSE)
    }) %>% invisible
}

# strip whitespace from string
strip <- function(string) { gsub('^\\s+|\\s+$', '', string) }

# multicore batch function
mc_batch <- function(objectList, fun, batch.size=1000, mc.cores=8, fallback.cores=1) {

    mclres = list()
    n = length(objectList)
    i = trunc(seq(1,n, by=batch.size))
    j = c(i[-1]-1, n)

    for (n in 1:length(i)) {
        cat("batch ",n,"/",length(i),"      \r")
        mclapply(objectList[i[n]:j[n]], fun, mc.cores=mc.cores) -> mclres[[n]]
    }

    unlist(mclres, recursive=FALSE)
}

# format vector for code use
PrintVector <- function(vector) {

   out.vector <-
      c( str_c("'", vector[1]),
         vector[2:length(vector)],
         str_c(vector[length(vector)], "'") )

   cat(out.vector, sep = "', '")

}

Mode <- function(x) {
   ux <- unique(x)
   ux[which.max(tabulate(match(x, ux)))]
}


SplitList <- function(x, length) { split(x, ceiling(seq_along(x) / length)) }


#------
# I / O
#------

# return sheets in excel arbitrary file
xlsx_sheets <- function(file){ names(getSheets(loadWorkbook(file))) }

# read delim abbreviation
read_tab <- function(x, ...) { read.delim(x, sep='\t',stringsAsFactors=FALSE) %>% tbl_df }

# write data frame abbreviation
write_df <- function(d, ...) {
    name = str_c(...)
    write.table(d, file=name, sep="\t", na="", quote=FALSE, row.names=FALSE, col.names=TRUE)
}


#----------------
# dplyr utilities
#----------------

# print multi-line abbreviation
`%p%` <- p <- function(x, n = Inf) {print(x = x, n = n)}

# print random rows
`%sp%` <- sp <- function(x, n) {x %>% sample_n(n) %>% p(n)}

# glimpse
`%g%` <- g <- function(x, w = NULL) {glimpse(x, width = w)}

`%!in%` <- function(x, y) {!('%in%'(x, y))}

# unisort
usort <- function(x) {x %>% sort %>% unique}


#------------------
# system navigation
#------------------

# get working directory abbreviation
pwd <- function() {getwd()}

# change working directory & manage wd variable
cd <- function(path, ...) {
    setwd(path, ...)
    wd <<- getwd()
}

# open file or folder
opn <- function(path = '.') {
    if(system('if [[ $(who am i) =~ \\([0-9\\.]+\\)$ ]]; then echo REMOTE; else echo LOCAL; fi', intern = TRUE) == 'REMOTE') {
        system(paste('opn', path))
    } else {
        system(paste('open', path))
    }
}

subl <- function(path = '.') {
	system(paste('subl', path))
}

# list system files
lf <- function( path = getwd(), ...){ list.files(path, ...) }


#--------------------
# .Rprofile functions
#--------------------

# edit .Rprofile
edit_rp <- function(){ system('$EDITOR ~/gitProfiles/.Rprofile') }

# git sync .Rprofile
sync_rp <- function(message){ system(str_c('$(cd/gitProfiles; git sync \"",message,"\")')) }

# re-source .Rprofile
source_rp <- function(){ source('~/gitProfiles/.Rprofile') }


#-----------------
# system utilities
#-----------------

# imgcat function
img <- function(file){ system(str_c('imgcat ', file)) }


#----------------------
# interactive execution
#----------------------

if (interactive()) {

    # system initialization (loads system packages)
    .First.sys()

    # load common libraries
    libs()

    # set command line coloring
    suppressMessages(setOutputColors(normal=8, negnum=7, zero=7, number=7, date=6, string=4, const=6, false=5, true=2, infinite=6, stderror=8, warn=c(3,0,3), error=c(1,0,1), verbose=FALSE, zero.limit=NA))

    # emacs config
    require(grDevices)
    X11.options(type = 'cairo')

}

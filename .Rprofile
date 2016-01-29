# R startup options

options(editor="subl")
options(width = 150)

suppressMessages(library(colorout))
suppressMessages(setOutputColors(
	normal=8,
	negnum=7,
	zero=7,
	number=7,
	date=6,
	string=4,
	const=6,
	false=5,
	true=2,
	infinite=6,
	stderror=8,
	warn=c(3,0,3),
	error=c(1,0,1),
	verbose=FALSE,
	zero.limit=NA))

# load dplyr-family
dplyr<-function(){
	pacman::p_load(openxlsx,plyr,dplyr,readr,tidyr,magrittr,stringr,purrr,crayon)
}

# get last value
lv <- function(){.Last.value}

# helpful R functions

lv <- function() .Last.value

ll <- function() {
        tmp<-sapply(ls(globalenv()), function(x) object.size(get(x,envir=globalenv())))
        round(sort(tmp)/1024)
}

xw <- function(w,h) {x11(width=w,height=h)}

write.data.frame<-function(d,...) {
	name=paste(...,sep="")
	write.table(d,file=name,sep="\t",na="",quote=FALSE,row.names=FALSE,col.names=TRUE)
}

strip <- function (x) gsub("^\\s+|\\s+$", "", x)

kc <- function() { kill(children()); collect() }

mcbatch <- function(objectList, fun, batch.size=1000, mc.cores=8, fallback.cores=1) {
	# run in batches
	mclres=list()
	n=length(objectList)
	i=trunc(seq(1,n,by=batch.size))
	j=c(i[-1]-1,n)
	for (n in 1:length(i)) {
		cat("batch ",n,"/",length(i),"      \r")
		mclapply(objectList[i[n]:j[n]],fun,mc.cores=mc.cores)->mclres[[n]]
	}
	unlist(mclres,recursive=FALSE)
}

g <- function() {graphics.off()}

list.as.data.frame <- function(x, row.names=NULL, optional=FALSE, ...) {
	if(!all(unlist(lapply(x, class)) %in% 
				c('raw','character','complex','numeric','integer','logical'))) {
		warning('All elements of the list must be a vector.')
		NextMethod(x, row.names=row.names, optional=optional, ...)
	}
	allequal <- all(unlist(lapply(x, length)) == length(x[[1]]))
	havenames <- all(unlist(lapply(x, FUN=function(x) !is.null(names(x)))))
	if(havenames) { #All the vectors in the list have names we can use
		colnames <- unique(unlist(lapply(x, names)))
		df <- data.frame(matrix(
			unlist(lapply(x, FUN=function(x) { x[colnames] })),
			nrow=length(x), byrow=TRUE))
		names(df) <- colnames
	} else if(allequal) { #No names, but are of the same length
		df <- data.frame(matrix(unlist(x), nrow=length(x), byrow=TRUE), ...)
		hasnames <- which(unlist(lapply(x, FUN=function(x) !is.null(names(x)))))
		if(length(hasnames) > 0) { #We'll use the first element that has names
			names(df) <- names(x[[ hasnames[1] ]])
		}
	} else { #No names and different lengths, we'll make our best guess here!
		warning(paste("The length of vectors are not the same and do not ",
					"are not named, the results may not be correct.", sep=''))
		#Find the largest
		lsizes <- unlist(lapply(x, length))
		start <- which(lsizes == max(lsizes))[1]
		df <- x[[start]]
		for(i in (1:length(x))[-start]) {
			y <- x[[i]]
			if(length(y) < length(x[[start]])) {
				y <- c(y, rep(NA, length(x[[start]]) - length(y)))
			}
			if(i < start) {
				df <- rbind(y, df)
			} else {
				df <- rbind(df, y)
			}
		}
		df <- as.data.frame(df, row.names=1:length(x))
		names(df) <- paste('Col', 1:ncol(df), sep='')
	}
	if(missing(row.names)) {
		row.names(df) <- names(x)
	} else {
		row.names(df) <- row.names
	}
	return(df)
}

# bioinformatics functions [requires Rsamtools]

bamcoverage <- function (bamfile) {
  # read in the bam file
  bam <- scanBam(bamfile)[[1]] # the result comes in nested lists
  # filter reads without match position
  ind <- ! is.na(bam$pos)
  ## remove non-matches, they are not relevant to us
  bam <- lapply(bam, function(x) x[ind])
  ranges <- IRanges(start=bam$pos, width=bam$qwidth, names=make.names(bam$qname, unique=TRUE))
  ## names of the bam data frame:
  ## "qname"  "flag"   "rname"  "strand" "pos"    "qwidth"
  ## "mapq"   "cigar"  "mrnm"   "mpos"   "isize"  "seq"    "qual"
  ## construc: genomic ranges object containing all reads
  ranges <- GRanges(seqnames=Rle(bam$rname), ranges=ranges, strand=Rle(bam$strand), flag=bam$flag, readid=bam$rname )
  ## returns a coverage for each reference sequence (aka. chromosome) in the bam file
  return (mean(coverage(ranges)))      
}

# manage directory variable

wd <- function(path=".",...){getwd(path)}

scd <- function(path,...){
	setwd(path,...)
	wd <<- getwd()
}

# permanantly set the CRAN REPO

local({
  r <- getOption("repos")
  r["CRAN"] <- "http://cran.cnr.berkeley.edu/"
  options(repos = r)
})

#chooseCRANmirror(0,graphics=FALSE)

# utilities

sopen <- function(path="."){system(paste("open",path))}

sopn <- function(path="."){system(paste("opn",path))}

sls <- function(path=getwd(),...){list.files(path,...)}

editRprofile <- function(){system("$EDITOR ~/gitProfiles/.Rprofile")}
pushRprofile <- function(message){system(paste("$(cd/gitProfiles; git sync \"",message,"\")",sep=""))}
sourceRprofile <- function(){source("~/gitProfiles/.Rprofile")}
editLog <- function(){system("$EDITOR ~/gitProfiles/log.md")}

rround <- function(x){trunc(x+0.5)}

# excel
xlsxSheets <- function(file){names(getSheets(loadWorkbook(file)))}



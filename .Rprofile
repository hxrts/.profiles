# R startup options

options(editor="subl")
stringsAsFactors=FALSE
options(width = 150)

# helpful R functions

ll<-function() {
        tmp<-sapply(ls(globalenv()), function(x) object.size(get(x,envir=globalenv())))
        round(sort(tmp)/1024,1)
}

x<-function(w,h) {x11(width=w,height=h)}

write.data.frame<-function(d,...) {
	name=paste(...,sep="")
	write.table(d,file=name,sep="\t",na="",quote=FALSE,row.names=FALSE,col.names=TRUE)
}

strip<-function (x) gsub("^\\s+|\\s+$", "", x)

kc<-function() { kill(children()); collect() }

mcbatch<-function(objectList, fun, batch.size=1000, mc.cores=8, fallback.cores=1) {
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

g<-function() {graphics.off()}

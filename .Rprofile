ll<-function() {
        tmp<-sapply(ls(globalenv()), function(x) object.size(get(x,envir=globalenv())))
        round(sort(tmp)/1024,1)
}
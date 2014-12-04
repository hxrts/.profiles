ll<-function() {
        tmp<-sapply(ls(globalenv()), function(x) object.size(get(x,envir=globalenv())))
        round(sort(tmp)/1024,1)
}

function(w,h) {x11(width=w,height=h)}

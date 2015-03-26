complete<-function(directory,id=1:332){
        files_full<-list.files(directory,full.names=TRUE)
        dat<-data.frame(id)
        nobs<-numeric(length=length(id))
        j<-1;
        for(i in id) {
               
                nobs[j]<- nrow(na.omit(read.csv(files_full[i])));
                j<- j+1
        }
        dat<-cbind(dat,nobs)    
        dat
}
corr<-function(directory,threshold=0){
        files_full<-list.files(directory,full.names=TRUE)
        n_file=length(files_full)
        cr<-rep(NA,n_file)
        data2<-complete(directory)
        nobs2<-data2$nobs
        for(i in 1:n_file){
                if(nobs2[i]>=threshold){
                        data1<-na.omit(read.csv(files_full[i]));
                        cr[i]<-cor(data1$nitrate,data1$sulfate)
                } 
        }
        cr<-cr[!is.na(cr)]
        cr<-as.numeric(cr)    
}
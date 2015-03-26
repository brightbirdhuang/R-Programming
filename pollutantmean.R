pollutantmean<-function(directory,pollutant,id=1:332){
        files_full<-list.files(directory,full.names=TRUE)
        dat<-data.frame()
        for(i in 1:332){
                dat<-rbind(dat,read.csv(files_full[i]))
        }
        dat_subset<-dat[which(dat[,"ID"]>= min(id) & dat[,"ID"]<= max(id)),]
        mean(dat_subset[,pollutant],na.rm=TRUE)
}
best<-function(state,outcome){
        ##read outcome data
        dat<-read.csv("outcome-of-care-measures.csv",colClasses = "character")
        ##cheeck that state and outcome are valid
        outcomes<-c("heart attack","heart failure","pneumonia")
        if(!(state %in% dat$State)){
                stop('invalid state') 
        }else if(!(outcome %in% outcomes)){
                stop('invalid outcome')
        }                
        ##return hospital name in that state with lowest 30-day death rate
        dat[,11]<-suppressWarnings(as.numeric(dat[,11]))
        dat[,17]<-suppressWarnings(as.numeric(dat[,17]))
        dat[,23]<-suppressWarnings(as.numeric(dat[,23]))
        dat1<-dat[order(dat$Hospital.Name,na.last=NA),]
        dat1<-dat1[,c(1,2,7,11,17,23)]
        colnames(dat1)<-c("Provider.Number","Hospital.Name","State","heart attack","heart failure","pneumonia")
        ##return hospital name in that state with lowest 30-day death rate
        ##
        
        dat1<-subset(dat1,dat1$State==state)
        index<-which.min(dat1[,c(outcome)])
        best_hosp<-dat1$Hospital.Name[index]
        best_hosp
}
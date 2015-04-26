# read data
setwd("C:/Users/Fancy/Desktop/coursera/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")
S_train<- read.table("./train/subject_train.txt")
xtrain<- read.table("./train/X_train.txt")
ytrain<- read.table("./train/y_train.txt")

S_test<- read.table("./test/subject_test.txt")
xtest<- read.table("./test/X_test.txt")
ytest<- read.table("./test/y_test.txt")
# merge all dataset& change variables' names for labels
test<-cbind(xtest,ytest,S_test)
train<-cbind(xtrain,ytrain,S_train)
data1<- data.frame(test,"test")
data2<- data.frame(train,"train")

features <- read.table("features.txt")
fname<-as.character(features[,2])
V_name<-c(fname,"activity","PNo.","ToT")
colnames(data1)<-V_name
colnames(data2)<-V_name
data<-rbind(data1,data2) #Raw data with labels

mean<- grep("mean()",names(data),fixed=TRUE,value=T)
std<-grep("std()",names(data),fixed=TRUE,value=T)
tidydata1<- data[,c(mean,std,"activity","PNo.","ToT")] # tidydata1: step 1,2,4 done

#step3; Uses descriptive activity names to name the activities in the data set
act<-tidydata1[,"activity"];
act<-gsub("1","WALKING",act);
act<-gsub("2","WALKING_UPSTAIRS",act);
act<-gsub("3","WALKING_DOWNSTAIRS",act);
act<-gsub("4","SITTING",act);
act<-gsub("5","STANDING",act);
act<-gsub("6","LAYING",act);
tidydata1[,"activity"]<- act 
tdata<-tidydata1

#step 5 I don't know how to do this in an easy way.
ddply(tdata,.(PNo.,activity),summarize,...)

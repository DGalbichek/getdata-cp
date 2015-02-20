library(dplyr)

# reading files
tests <- read.table("./UCI HAR Dataset/test/subject_test.txt")
testx <- read.table("./UCI HAR Dataset/test/X_test.txt")
testy <- read.table("./UCI HAR Dataset/test/y_test.txt")
trains <- read.table("./UCI HAR Dataset/train/subject_train.txt")
trainx <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainy <- read.table("./UCI HAR Dataset/train/y_train.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

# binding
testm<-cbind(tests,testy,testx)
trainm<-cbind(trains,trainy,trainx)

# eliminating outside sd values
for(i in 3:(ncol(testm))){
    testmf<-filter(testm,abs(testm[[i]]-mean(testm[[i]]))<sd(testm[[i]]))
}
for(i in 3:(ncol(trainm))){
    trainmf<-filter(trainm,abs(trainm[[i]]-mean(trainm[[i]]))<sd(trainm[[i]]))
}

# naming columns
names(testmf) <- c("Subject","Activity",features$V2)
names(trainmf) <- c("Subject","Activity",features$V2)

# more binding
data<-tbl_df(rbind(testmf,trainmf))

# the second database with grouping
data2 <- group_by(data,Subject,Activity)

# I ran out of time... :(
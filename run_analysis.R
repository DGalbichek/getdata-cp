library(dplyr)

# reading source files
tests <- read.table("./UCI HAR Dataset/test/subject_test.txt")
testx <- read.table("./UCI HAR Dataset/test/X_test.txt")
testy <- read.table("./UCI HAR Dataset/test/y_test.txt")
trains <- read.table("./UCI HAR Dataset/train/subject_train.txt")
trainx <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainy <- read.table("./UCI HAR Dataset/train/y_train.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")

# merging the training and the test sets to create one data set.
testm<-cbind(tests,testy,testx)
trainm<-cbind(trains,trainy,trainx)
data<-rbind(testm,trainm)

# Appropriately labels the data set with descriptive variable names. 
names(data) <- combine("Subject","Activity",features$V2)

# Extracts only the measurements on the mean and standard deviation
# for each measurement. 
data<-data[combine(1,2,grep("-std()",names(data),fixed=TRUE),
                      grep("-mean()",names(data),fixed=TRUE))]

# Uses descriptive activity names to name the activities in the data set
data$Activity <- activityLabels[,2][match(data$Activity, activityLabels[,1])]



# second, independent tidy data set with the average of each variable
# for each activity and each subject.
data2 <- group_by(data,Subject,Activity)
data2<-rbind(aggregate(data2[, 3:68], list(data2$Activity), mean),
            aggregate(data2[, 3:68], list(as.character(data2$Subject)), mean))

#cleanup (getting rid of temporary stuff)
remove(activityLabels,features,testm,tests,testx,testy,
       trainm,trains,trainx,trainy,data)
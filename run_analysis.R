# This script is part of project work associated with "Getting and Cleaning Data"

# reshape2 is an R package written by Hadley Wickham that makes it easy to 
# transform data between wide and long formats.
install.packages("reshape2")
library(reshape2)

# Importing data from UCI HAR Dataset directory
testData <- read.table("./UCI HAR Dataset/test/X_test.txt")
testSubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")
testActivities <- read.table("./UCI HAR Dataset/test/y_test.txt")

trainData <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainSubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
trainActivities <- read.table("./UCI HAR Dataset/train/y_train.txt")

featuresList <- read.table("./UCI HAR Dataset/train/X_train.txt")

# Assign column names
colnames(testActivities) <- "Activity"
colnames(trainActivities) <- "Activity"
colnames(testSubjects) <- "Subject"
colnames(trainSubjects) <- "Subject"

# Remove punctuations from feature names
colNames <- gsub("[[:punct:]]","", featuresList$V2, ignore.case = FALSE, perl = FALSE)

# Assign features as column names to test and train dataset
colnames(testData) <- colNames
colnames(trainData) <- colNames

# Merging the training and the test sets to create one data set.

testDataMerged <- cbind(testSubjects, testActivities,testData)
trainDataMerged <- cbind(trainSubjects, trainActivities,trainData)
completeData <- rbind(testDataMerged, trainDataMerged)


# Extracting only the measurements on the mean and standard deviation for each measurement.

meanFiltered <- grep("mean",names(completeData),ignore.case=TRUE)
mean_colNames <- names(completeData)[meanFiltered]
stdFiltered <- grep("std",names(completeData),ignore.case=TRUE)
std_colNames <- names(completeData)[stdFiltered]

completeDataFiltered <- completeData[, c("Subject","Activity", mean_colNames, std_colNames)]

# Assigned descriptive activity names to name the activities in the data set
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE, col.names=c('ID', 'Activity'))


# Appropriately labeled the data set with descriptive variable names.
completeDataFiltered_byActivity <- merge(activityLabels, completeDataFiltered,by.x="ID",by.y="Activity",all=TRUE)
completeDataFiltered_byActivity$ID <- NULL
tidyData <- melt(completeDataFiltered_byActivity, id.vars = c("Subject","Activity"))

# Step 5: From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
tidyData_Mean <- dcast(tidyData, Subject + Activity ~ variable, mean)
write.table(tidyData_Mean,"./Output_meanTidyData.txt", row.names = FALSE)
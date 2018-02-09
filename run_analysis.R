library("reshape2")

zippedFileName <- "data.zip"

prepareDataSet <- function() {
  if (!file.exists(zippedFileName)) {
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", zippedFileName, method = "curl")
  }
  unzip(zippedFileName)
}

#make sure data set exists in working directory
if (!dir.exists("UCI HAR Dataset")) {
  message("preparing data set")
  prepareDataSet()
}

#prepare required features names
message("preparing features data")
#read features dataset
features <- read.table("UCI HAR Dataset/features.txt")
#get rid of factor in features names
features[,2] <- as.character(features[,2])
#find features we need
neededFeatures <- grep(".*mean.*|.*std.*",features[,2])
#set names
featuresNames <- features[foundFeatures, 2]
#clean up names a bit
featuresNames <- gsub("-mean", "Mean",featuresNames)
featuresNames <- gsub("-std", "StandardDeviation",featuresNames)
featuresNames <- gsub("^t", "time", featuresNames)
featuresNames <- gsub("^f", "frequency", featuresNames)
featuresNames <- gsub("Acc", "Accelerometer", featuresNames)
featuresNames <- gsub("Gyro", "Gyroscope", featuresNames)
featuresNames <- gsub("Mag", "Magnitude", featuresNames)
featuresNames <- gsub("[-()]", "",featuresNames)

#prepare activity labels
message("preparing activities labels")
#read activity dataset
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
#get rid of factor
activities[,2] <- as.character(activities[,2])

#read and merge training and test datasets
message("reading and joining data sets")
trainData <- read.table("UCI HAR Dataset/train/X_train.txt")[neededFeatures]
testData <- read.table("UCI HAR Dataset/test/X_test.txt")[neededFeatures]
mergedData <- rbind(trainData, testData)

trainActivitiesData <- read.table("UCI HAR Dataset/train/Y_train.txt")
testActivitiesData <- read.table("UCI HAR Dataset/test/Y_test.txt")
mergedActivitiesData <- rbind(trainActivitiesData, testActivitiesData)

trainSubjectsData <- read.table("UCI HAR Dataset/train/subject_train.txt")
testSubjectsData <- read.table("UCI HAR Dataset/test/subject_test.txt")
mergedSubjectsData <- rbind(trainSubjectsData, testSubjectsData)

mergedData <- cbind(mergedSubjectsData, mergedActivitiesData, mergedData)
  
#set names
colnames(mergedData) <- c("subject", "activity", featuresNames)

#factorize activity and subject
message("cleaning and calculating average")
mergedData$activity <- factor(mergedData$activity, levels = activities[,1], labels = activities[,2])
mergedData$subject <- as.factor(mergedData$subject)

#melt data to make it cleaner
meltedData <- melt(mergedData, id = c("subject", "activity"))
meanData <- dcast(meltedData, subject + activity ~ variable, mean)

#save result to file
write.table(meanData, "result.txt", row.names = FALSE, quote = FALSE)

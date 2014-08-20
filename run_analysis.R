# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Data file is located here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Read train data
x_train <- read.table('./UCI HAR Dataset/train/X_train.txt')
y_train <- read.table('./UCI HAR Dataset/train/y_train.txt')
subject_train <- read.table('./UCI HAR Dataset/train/subject_train.txt')

# Merge the train data into one data set
mergedTrainSet <- cbind(x_train,y_train,subject_train)

# Read test data
x_test <- read.table('./UCI HAR Dataset/test/X_test.txt')
y_test <- read.table('./UCI HAR Dataset/test/y_test.txt')
subject_test <- read.table('./UCI HAR Dataset/test/subject_test.txt')

# Merge the test data into one data set
mergedTestSet <- cbind(x_test,y_test,subject_test)

# Merge train and test data
mergedDataSet <- rbind(mergedTrainSet,mergedTestSet)

# Read the features names and add column names for the activity type and subject id
features <- read.table('./UCI HAR Dataset/features.txt')[,2]
column_names <- factor(c(as.character(features),"activityType","subjectID"))

# Assign column names to the merged data set
names(mergedDataSet) <- column_names

# Find the columns which represent measurments on the mean and standard deviation of the data or are the activityType or subjectID variables
extractedFeatures = grepl("(([M|m]ean)|(std)|(activityType)|(subjectID))",names(mergedDataSet))

# Create a dataset containing only the extracted features, activityType and subjectID
extractedFeaturesDataSet = mergedDataSet[extractedFeatures]

# Read the possible activity types
activityType <- read.table('./UCI HAR Dataset/activity_labels.txt')

# Assign activity labels 
extractedFeaturesDataSet$activityType = sapply(extractedFeaturesDataSet$activityType,function(x) activityType[x,2])

# Get the columns on which we aggrgate the data on so we can remove them later
columnsToAggregateBy = names(extractedFeaturesDataSet) %in% c("activityType","subjectID")

# Aggregate the data according to subjectID and activityType, calculating the mean value of each variable
tidyDataMeanSummary = aggregate(extractedFeaturesDataSet[,!columnsToAggregateBy],by = list(activityType = extractedFeaturesDataSet$activityType, subjectID = extractedFeaturesDataSet$subjectID),FUN = mean)

# Create an output file of the tidy data
write.table(tidyDataMeanSummary, './tidyData.txt',row.names=FALSE,sep='\t')

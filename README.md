Getting and Cleaning Data - Course Project
==========================================

## What the script does
The run_analysis.R script does the following:<br>
1. Merges the training and the test sets to create one data set.<br>
2. Extracts only the measurements on the mean and standard deviation for each measurement.<br>
3. Uses descriptive activity names to name the activities in the data set<br>
4. Appropriately labels the data set with descriptive variable names. <br>
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## How it works
1. Read the train and test data into temporary variables (from: X_train.txt, y_train.txt, subject_train.txt, X_test.txt, y_test.txt, subject_test.txt)
2. Merge the train and test data into one data set.
3. Read all the feature names (from: features.txt) and assign these names to the merged data set.
4. Create a subset of the merged data set which contains the following columns: activity type, subject id and all the features containing the words 'mean' or 'std' (case insensitive).
5. Read the activity labels (from: activity_labels.txt) and assign their values to the newly created subset.
6. Create the tidy data table by calculating the mean of every feature for every user id and activity type.
7. Reformat the tidy data column names: 'std' -> 'Std', 'mean -> 'Mean', remove '-', remove '()'.
8. Write the tidy data table to tidyData.txt.

## How to run the script
After making sure the script and the original data are in the same directory, source `run_analysis.R`. You should then see the following output:

Reading train data<br>
Reading test data<br>
Merging train and test data<br>
Reading feature names<br>
Extracting relevant features<br>
Reading activity types<br>
Calculating mean for activity type and user id<br>
Reformatting tidy data column names<br>
Creating output file

# Code Book

## Data Source

The original data represent data collected from the accelerometers from the Samsung Galaxy S smartphone.
A full description of the of the data can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The complete data can be downloaded from here:
downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Variables

* `x_train` - a table representing the X_train.txt file

* `y_train` - a table representing the y_train.txt file

* `subject_train` - at table representing the subject_train.txt file

* `mergedTrainSet` - a data set consisting of `x_train`, `y_train` and `subject_train`

* `x_test` - a table representing the X_text.txt file

* `y_test` - a table representing the y_test.txt file

* `subject_test` - at table representing the subject_test.txt file

* `mergedTestSet` - a data set consisting of `x_test`, `y_test` and `subject_test`

* `mergedDataSet` - a data set consisting of `mergedTrainSet` and `mergedTestSet`

* `activityType` - a list representing the possible activity values as they appear in activity_labels.txt (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

* `features` - the features names as they appear in features.txt

* `column_names` - a concatenation of the `features` vector and "activtiyType","subjectID"

* `extractedFeatures` - a logical vector representing the columns in `mergedDataSet` that contain the strings "mean", "Mean", "std", "activityType", "SubjectID" 

* `extractedFeaturesDataSet` - a dataset consisting of the columns in the `extractedFeatures` vector

* `columnsToAggregateBy` - a logical vector of all the columns in the `extractedFeatureDataSet` besides "activityType" and "subjectID"

* `tidyDataMeanSummary` - a data set representing the mean values of all the variables in `extractedFeaturesDataSet`, aggregated by "subjectID" and "activityType"

## Tidy Data

The final output file contains a mean value for every feature that has 'mean' or 'std' in its name. The mean value is calculated for every subject id/activity type pair.
In order to keep the data tidy, the following steps were performed on the column names:<br>
1. 'mean' changes to 'Mean'.<br>
2. 'std' changes to 'Std'.<br>
3. '()' were removed.<br>
4. '-' were removed.<br>

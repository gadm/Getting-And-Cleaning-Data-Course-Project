# Code Book

* `x_train` - a table representing the X_train.txt file

* `y_train` - a table representing the y_train.txt file

* `subject_train` - at table representing the subject_train.txt file

* `mergedTrainSet` - a data set consisting of `x_train`, `y_train` and `subject_train`

* `x_test` - a table representing the X_text.txt file

* `y_test` - a table representing the y_test.txt file

* `subject_test` - at table representing the subject_test.txt file

* `mergedTestSet` - a data set consisting of `x_test`, `y_test` and `subject_test`

* `mergedDataSet` - a data set consisting of `mergedTrainSet` and `mergedTestSet`

* `features` - the features names as they appear in features.txt

* `column_names` - a concatenation of the `features` vector and "activtiyType","subjectID"

* `extractedFeatures` - a logical vector representing the columns in `mergedDataSet` that contain the strings "mean", "Mean", "std", "activityType", "SubjectID" 

* `extractedFeaturesDataSet` - a dataset consisting of the columns in the `extractedFeatures` vector

* `columnsToAggregateBy` - a logical vector of all the columns in the `extractedFeatureDataSet` besides "activityType" and "subjectID"

* `tidyDataMeanSummary` - a data set representing the mean values of all the variables in `extractedFeaturesDataSet`, aggregated by "subjectID" and "activityType"

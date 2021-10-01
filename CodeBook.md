# CodeBook

The script run_analysis.R performs a series transformations in order the tidy up the data from the Human Activity Recognition Using Smartphones Data Set, which can be downloaded under the following link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This codebook is intended to provide a brief description of the variables a data that the above mentioned script produces in each processing step.

1. Download, extract and merge the training and test data set

The data is downloaded and first fetch into a temporary file before being extracting and merging the training and test data sets

- training <- X_train.txt : Training set
- test <- X_test.txt : Test set
- merged_data : merged test and training sets

2. Labeling the activities in the merged data set 

- labels_features <- features.txt : List of all features
- labels_training <- y_train.txt : Training labels
- labels_test <- y_test.txt : Test labels
- activity_labels <- activity_labels.txt : Links the class labels with their activity name
- merged_labels : merged training and test labels already linked to the activity labels
- merged_data : merged test and training sets with descriptive activity labels

3. Extract measurements on the mean and standard deviation of each value

- merged_data_mean_std : merged test and training sets with descriptive activity labels including only the mean and standard deviation for each measurement

4. Create a second, independent tidy data set with the average of each variable for each activity and each subject

- subjects_training <- subject_train.txt : training subjects
- subject_test <- subject_test.txt : test subjects
- merged_subjects : merged test and training subjects
- merged_data_mean_std : merged test and training sets with descriptive activity and subject labels including only the mean and standard deviation for each      measurement
- tidy_data : independent tidy data set with the average of each variable for each activity and each subject

5. Label the data set with descriptive variable names

- untidy_labels <- c("^f", "^t", "Acc", "Gyro", "Mag", "BodyBody", "tbody") : The labels contained in the original data set 
- tidy_labels <- c("Frequency", "Time", "Accelerometer", "Gyroscope", "Magnitude", "Body", "TimeBody") : The replacement labels (in same order)
- tidy_data : the final output of the script with the processed, cleaned up data

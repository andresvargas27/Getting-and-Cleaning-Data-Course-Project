library(tidyverse)

################################################################################
#download, extract and merge the training and test data set
################################################################################

#create a file to store the data temporarily
temp <- tempfile()

#download the data and fetch it into the temp. file
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", temp)

#extract and merge the training and the test data set
training <- read.table(unz(temp, "UCI HAR Dataset/train/X_train.txt"))

test <- read.table(unz(temp, "UCI HAR Dataset/test/X_test.txt"))

merged_data <- rbind(training, test)

################################################################################
#labeling the data sets activities
################################################################################

#extract labels for each measurement (feature vector labels)
labels_features <- read.table(unz(temp, "UCI HAR Dataset/features.txt"))

#set the feature labels as column names
colnames(merged_data) <- labels_features$V2

#extract the activity labels for both data sets
labels_training <- read.table(unz(temp, "UCI HAR Dataset/train/y_train.txt"))

labels_test <- read.table(unz(temp, "UCI HAR Dataset/test/y_test.txt"))

activity_labels <- read.table(unz(temp, "UCI HAR Dataset/activity_labels.txt"))

#assign corresponding activities to the training and test labels
labels_training <- left_join(labels_training, activity_labels, by = "V1")

labels_test <- left_join(labels_test, activity_labels, by = "V1")

#merge training and test labels
merged_labels <- rbind(labels_training, labels_test)

#add labels to name the activities in the merged data set
merged_data$activity <- merged_labels$V2

#reorder columns
merged_data <- merged_data[, c(562, 1:561)]

################################################################################
#extract measurements on the mean and standard deviation of each value
################################################################################

merged_data_mean_std <- cbind(merged_data$activity, merged_data %>% select(contains("mean") | contains("std")))

################################################################################################################
#create a second, independent tidy data set with the average of each variable for each activity and each subject
################################################################################################################

#extract and merge the labels for the subjects
subjects_training <- read.table(unz(temp, "UCI HAR Dataset/train/subject_train.txt"))

subject_test <- read.table(unz(temp, "UCI HAR Dataset/test/subject_test.txt"))

merged_subjects <- rbind(subjects_training, subject_test)

#add subject labels to the data set
merged_data_mean_std$subject <- merged_subjects$V1

#reorder  and rename columns
merged_data_mean_std <- merged_data_mean_std[, c(88, 1:87)]
colnames(merged_data_mean_std)[1:2] <- c("subject", "activity")

#create the independent tidy data set
tidy_data <- merged_data_mean_std %>% group_by(subject, activity) %>%
  summarise(across(everything(), mean))

#remove temp. file
rm(temp)

################################################################################
#label the data set with descriptive variable names
################################################################################

#vector with variable labels to be replaced
untidy_labels <- c("^f", "^t", "Acc", "Gyro", "Mag", "BodyBody", "tbody")

#vector with tidy labels
tidy_labels <- c("Frequency", "Time", "Accelerometer", "Gyroscope", "Magnitude", "Body", "TimeBody")

#create a vector with the replaced variable names
n = 1
colnames_temp <- colnames(tidy_data)
for (i in untidy_labels){
  colnames <- str_replace_all(colnames_temp, untidy_labels[n], tidy_labels[n])
  colnames_temp <- colnames
  n = n + 1
}

#remove temp. objects n and colnames_temp
rm(n)
rm(colnames_temp)

#replace the variable labels with the descriptive names
colnames(tidy_data) <- colnames

#write output
write_csv(tidy_data,"/Users/andres/Desktop/Data_Science_Specialization/Getting_and_cleaning_data/Week 4/tidy_data_set.csv")



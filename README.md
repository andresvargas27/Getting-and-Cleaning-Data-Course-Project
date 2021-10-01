# Getting-and-Cleaning-Data-Course-Project

This repository contains a brief description of all the required analysis files for the Getting and Cleaning Data Course Project and also a link to the processed data set.

- The data set used for the analysis can be found under this link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Files contained in this repository:

- CodeBook.md : description of the modified and updated data indicating all the variables and summaries calculated, along with units, and any other relevant information 
- run_analysis.R : this script performs all the required data preparation steps. These are:

                    1. Merges the training and the test sets to create one data set.

                    2. Uses descriptive activity names to name the activities in the data set

                    3. Extracts only the measurements on the mean and standard deviation for each measurement 

                    4. From the data set in step 3, creates a second, independent tidy data set with the average of each variable 
                       for each activity and each subject. 

                    5. Appropriately labels the data set with descriptive variable names.
                       
    *Please note that the order of the steps doesn't exactly coincide with the sequence provided in the course: the activities are named before extracting the mean and standard deviation for each measurement. And the labeling of the data set with descriptive variable names is carried out after creating the independent tidy data set with the average of each variable for each activity and subject. This leads to the same output. 
    
 - tidy_data.txt: the generated tidy data set 

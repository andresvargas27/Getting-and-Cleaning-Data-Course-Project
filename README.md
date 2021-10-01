# Getting-and-Cleaning-Data-Course-Project

This repository contains a brief description of all the required analysis files for the Getting and Cleaning Data Course Project and also a link to the processed data set.

- The data set used for the analysis can be found under this link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Files contained in this repository:

- CodeBook.md : description of the modified and updated data indicating all the variables and summaries calculated, along with units, and any other relevant information 
- run_analysis.R : this script performs all the required data preparation steps. These are:

                    1. Merges the training and the test sets to create one data set.

                    2. Uses descriptive activity names to name the activities in the data set

                    3. Appropriately labels the data set with descriptive variable names. 

                    4. Extracts only the measurements on the mean and standard deviation for each measurement. 

                    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
                       for each activity and each subject.
    
    *Please note that the order of the steps doesn't exactly coincide with the formulation provided in the course: before extracting the measurements on the mean        and the standard deviation, all the labeling tasks were done
    
 - tidy_data.txt: the generated tidy data set 

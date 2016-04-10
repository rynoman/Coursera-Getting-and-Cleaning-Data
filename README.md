# Assignment: Getting and Cleaning Data Course Project
Explains the analysis files is clear and understandable.

This read me document explains how all of the scripts work and how they are 
connected.

## Script download_data performs below 2 steps:
Step 1: Downloads dataset from given URL
Step 2: Unzips the downloaded dataset - all data is stored in the current working directory.

## Script run_analysis performs below 5 steps:
Step 1: Merges the training and the test sets to create one data set.
Step 2: Extracts only the measurements on the mean and standard deviation for 
        each measurement.
Step 3: Uses descriptive activity names to name the activities in the data set
Step 4: Appropriately labels the data set with descriptive variable names.
Step 5: From the data set in step 4, creates a second, independent tidy data set 
        with the average of each variable for each activity and each subject.
        
How to use these scripts?
1. run_analysis script assumes data is available in "UCI HCR Dataset".
2. If data is not available, please use download_data script. 
3. source('download_data.R')

Now you can execute the run_analysis script.
4. source('run_analysis.R')
5. The final result is stored in the file called "Output_meanTidyData.txt"

During the execution of script 2 Datasets will be available 
"tidyData" & "tidyData_Avg"
Both the datasets as well as the output file follows the rules of Tidydata.
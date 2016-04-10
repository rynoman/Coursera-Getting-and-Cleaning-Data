# This script is part of project work associated with "Getting and Cleaning Data"

# reshape2 is an R package written by Hadley Wickham that makes it easy to 
# transform data between wide and long formats.

# Make sure "reshape2" is installed & inform user to install if it's missing. 
if (!("reshape2" %in% rownames(installed.packages())) ) {
        print("Missing package - reshape2. Please install as this script usage the package.")
        }


Step 1: Merges the training and the test sets to create one data set.

Step 2: Extracts only the measurements on the mean and standard deviation for 
each measurement.

Step 3: Uses descriptive activity names to name the activities in the data set

Step 4: Appropriately labels the data set with descriptive variable names.

Step 5: From the data set in step 4, creates a second, independent tidy data set 
with the average of each variable for each activity and each subject.
# This script will download the required dataset from Internet using the URL given below
# The Dataset will be in "ZIP" format and saved into the current working directory.
# Unzip command is used to extract the compressed data

download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip',destfile = 'UCI HAR Dataset.zip', method = 'curl')
unzip('UCI HAR Dataset.zip')
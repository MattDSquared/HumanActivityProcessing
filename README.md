# HumanActivityProcessing
Welcome! This is from a Coursera project designed to practice getting and cleaning data. The original data are from a study performed by the Università degli Studi di Genova, Genoa (I-16145), Italy which measured intertial data from a smartphone during various activities. The data is housed by the UC Irvine Machine Learning Repository. More details about the study can be found at the link below.

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

A zip file containing this data can be downloaded (as of 2015.04.22)  [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) from cloudfront.net.

These data track the activity of 30 volunteers doing various activity, such as walking up/down stairs, standing, or lying down. The raw inertial data from the smartphone was preprocessed as discussed in the link to study and placed in the following files:
* activity_labels.txt
* features.txt
* test/X_test.txt
* test/y_test.txt
* test/subject_test.txt
* train/X_train.txt
* train/y_train.txt
* train/subject_train.txt

The goal of this project is to gather, clean and produce a single, tidy dataset from these files. The resulting file, called tidydata.txt, follows the following tidy data principles:
1. Each variable measured should be in one column
2. Each different observation of that variable should be in a different row
3. There should be one table for each "kind" of variable
4. If there are multiple tables, they should included a column in the table that allows them to be linked.
 
The tidy data is the average, by volunteer and activity, of the measurements for mean and standard deviation within the data. The script `run_analysis.R` peforms the following to achieve this tidy dataset.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Sourcing the script `download.R` in this repository will download and unzip all necessary files to R's working directory. `download.R` is called from within `run_analysis.R`. 


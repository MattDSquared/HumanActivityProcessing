# Code Book for Human Activity Processing
## Overview
As explained the README.md file of this repo, the data and much of the explanation for it can be found from the study's host website. See README.md for an explanation of how this dataset was built.

All data in this dataset is derived from the accelerometer and gyroscope of a Samsung Galaxy S II. The data produced by `run_analysis.R` is saved to the file `tidydata.txt`. This tidy dataset takes the mean and standard deviation values provided by the UCI repository and averages them by volunteer and activity. The activity data was labeled manually from video of the experiments, see the study's website for links to videos.

A summary of the file `features_info.txt` from the UCI data set is copied below. Measurements not used in the tidydata analysis are excluded from this code book. Several variable names have been altered to agree with R naming convention and syntax. The volunteer and activity data were merged into the UCI features data set to produce the tidydata average groupings.

## Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. The data is summarized by the first two variables, subject and activity

* subject
* activity
* tBodyAcc.XYZ
* tGravityAcc.XYZ
* tBodyAccJerk.XYZ
* tBodyGyro.XYZ
* tBodyGyroJerk.XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc.XYZ
* fBodyAccJerk.XYZ
* fBodyGyro.XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean.: Mean value
* std.: Standard deviation

The variable and feature are combined to make a list of 79 unique variables (not listed here for brevity). For example, the features 'tBodyAcc.XYZ' and the variable 'mean' combine into the unique variables: 'tBodyAcc.mean.X', 'tBodyAcc.mean.Y', 'tBodyAcc.mean.Z'.

_Note: only mean and standard deviation values were included in the tidydata.txt dataset_

_The complete list of variables of each feature vector is available in 'features.txt' of the UCI data_

## Units and value interpretation
All feature values are normalized and bounded between -1 and 1, regardless of their original units. The Volunteer is an integer between 1 and 30, and the activity is any of the following text: 

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LYING

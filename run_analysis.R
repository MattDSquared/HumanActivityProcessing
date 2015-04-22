# =============================================================================
# run_analysis.R
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each
#    measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.
# =============================================================================
library("dplyr")
if (file.exists("HumanActivityProcessing")) setwd("HumanActivityProcessing")

# =============================================================================
# Download and unzip data files
# =============================================================================
source("download.R")
filenames <- dldata("UCI HAR dataset.zip",
                    "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")
filepath <- "./UCI HAR Dataset/"

# =============================================================================
# 0. Load data into R
# do this here instead of in separate function for purposes of course grading
# =============================================================================
# load feature names
con <- file(paste(filepath,"features.txt", sep=""),"r")
featurenames <- readLines(con); close(con)
nfeatures <- length(featurenames)

# clean out leading number and space
startat <- regexpr(" ", featurenames)
startat <- startat + attr(startat, "match.length")
featurenames <- substring(featurenames, startat)

# remove parens and replace - with .
featurenames <- gsub("[(][)]", "", featurenames)
featurenames <- gsub("[-]", ".", featurenames)

# load activity names
con <- file(paste(filepath,"activity_labels.txt", sep=""),"r")
activities <- readLines(con); close(con)
# clean out leading number and space
startat <- regexpr(" ", activities)
startat <- startat + attr(startat, "match.length")
activities <- substring(activities, startat)

# load data
train.data <- read.table(paste(filepath,"train/X_train.txt", sep=""), 
                     col.names = featurenames, colClasses = "numeric")
train.label <- read.table(paste(filepath,"train/y_train.txt", sep=""),
                          col.names = "activity")
train.subject <- read.table(paste(filepath,"train/subject_train.txt", sep=""),
                            col.names = "subject")

test.data <- read.table(paste(filepath,"test/X_test.txt", sep=""), 
                     col.names = featurenames, colClasses = "numeric")
test.label <- read.table(paste(filepath,"test/y_test.txt", sep=""),
                         col.names = "activity")
test.subject <- read.table(paste(filepath,"test/subject_test.txt", sep=""),
                           col.names = "subject")

# =============================================================================
# 1. Merge test and training data sets
# =============================================================================
DT <- rbind(train.data,test.data)
labels <- rbind(train.label,test.label)
subjects <- rbind(train.subject,test.subject)
DT <- mutate(DT, activity = labels$activity, subject = subjects$subject)

# =============================================================================
# 2. Extract mean and std dev of each measurement
# also keep the activity and subject names
# =============================================================================
DT <- DT[,grepl("mean|std|activity|subject",names(DT))]
# TODO: this is a little unsafe, since not guarenteed unique "activity" or 
#   "subject" variables, but it works for this dataset. RegExpr for better way

# =============================================================================
# 3. name activities in dataset
# =============================================================================
DT <- mutate(DT, activity = factor(DT$activity, levels=1:6, labels=activities))

# =============================================================================
# 4. Rename feature labels
# =============================================================================
# this is completed during data load, see section 0. Load data into R
#   approximately line 23

# =============================================================================
# 5. Average of each variable by activity and subject
# =============================================================================
datasummary <- DT %>% group_by(subject,activity) %>% summarise_each(funs(mean))

# =============================================================================
# 6. Write data
# =============================================================================
write.table(datasummary, "tidydata.csv", row.name = FALSE)

##
## Setting the working directory.
##
setwd("~/")
setwd("Teaching-and-Learning/Learning/Data-Science-Specialization/")
setwd("Data-Science-01-The-Data-Scientists-Toolbox/R/datasciencecoursera/")
if(!file.exists("GettingCleaningData")) dir.create("GettingCleaningData")
setwd("GettingCleaningData")
##
## Downloading the ".zip" data file and unzipping it.
##
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,destfile='zipfile.zip')
unzip("zipfile.zip")
##
## Reading files of the dataset. Important note: "activity_labels.txt" 
## matches the "activity id" (from 1 to 6) with the name of the corresponding 
## activity. "features.txt" lists the 561 features of the dataset. The data set
## is divided into training data and test data. Training data contain 7352 
## observations, while test data contain 2947 observations. "subject_train.txt"
## and "subject_test.txt" contain the id of subjects for each observation, 
## "y_train.txt" and "y_test.txt" contain the id of activities for each
## observation, and "X_test.txt" and X_train.txt" contain the 561 features 
## for each observation.
##
activity <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
features_train <- read.table("UCI HAR Dataset/train/X_train.txt")
activity_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
features_test <- read.table("UCI HAR Dataset/test/X_test.txt")
activity_test <- read.table("UCI HAR Dataset/test/y_test.txt")
##
## Merging the train and the test data sets. Since each data set contains three
## files, we first merge the three files of each data set in two different  
## dataframes, and then we merge the two resulting dataframes in one final data
## set called "data". "data" will contain 7352+2947=10299 observations and have 
## 563 columns. (Part 1 of the assignment).
##
train_df <- data.frame(subject_train,activity_train,features_train)
test_df <- data.frame(subject_test,activity_test,features_test)
data <- rbind(train_df,test_df)
names(data)=c("subject","activity",features[,2])
##
## Extracting from the merged data set "data" only the measurements on the mean 
## and standard deviation for each measurement and storing it in a new dataframe
## called "extracted". We use grep on "mean(" and "std(" to select the wanted
## features. "extracted" will have 10299 rows and 66 columns. (Part 2 of the 
## assignment).
##
extracted <- data[,c(1,2,grep("mean\\(|std\\(",features[,2])+2)]
##
## Replacing in dataset "extracted" the activity id (numbers from 1 to 6) with
## the corresponding activity names (listed in dataframe "activity"). This is, 
## replacing in "extracted$activity" the numeric activity ids with the 
## corresponding activity names. (Part 3 of the assignment).
##
extracted$activity <- activity[extracted$activity,2]
##
## Appropriately labeling "extracted" with descriptive variable names.
## (Part 4 of the assignment).
##
names(extracted) <- gsub("BodyBody","Body",names(extracted))
names(extracted) <- gsub("^t","Time",names(extracted))
names(extracted) <- gsub("^f","Frequency",names(extracted))
names(extracted) <- gsub("Acc","Acceleration",names(extracted))
names(extracted) <- gsub("Gyro","AngularVelocity",names(extracted))
names(extracted) <- gsub("Mag","Magnitude",names(extracted))
names(extracted) <- gsub("-","",names(extracted))
names(extracted) <- gsub("mean\\(\\)","Mean",names(extracted))
names(extracted) <- gsub("std\\(\\)","StandardDeviation",names(extracted))
names(extracted) <- make.names(names(extracted),unique=TRUE,allow_=TRUE)
##
## Creating a second, independent, tidy data set with the average of each 
## variable for each activity and each subject. For that, I'll create a new 
## data frame called "data_tidy" and store it in file "tidy-data.txt". I'll 
## make use of the "dplyr" library. (Part 5 of the assignment).
##
library(dplyr)
data_tidy <- arrange(extracted,subject,activity)
data_tidy <- data_tidy %>% group_by(subject,activity) %>% summarise_all(list("mean"))
write.table(data_tidy,"tidy-data.txt",row.names=FALSE)

---
title: "README"
author: ""
date: ""
output: html_document
---

## General Information

The goal of this project is to prepare tidy data that can be used for later analysis.

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The row data https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip represent data collected from accelerometers and gyroscopes from the Samsung Galaxy S smartphone. A full description of the data is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

One R script called run_analysis.R should be created and it has to be able to do the following:

1) Merge the training and the test sets to create one data set.
2) Extract only the measurements on the mean and standard deviation for each measurement.
3) Use descriptive activity names to name the activities in the data set.
4) Appropriately label the data set with descriptive variable names.
5) From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

## Files

In this repo you can find the following files:

1) "README.md": This file.
2) "CodeBook.md": Explains the actions performed on the row data to create the final, tidy data set
3) "run_analysis.R": Actual R code that performs the actions described in "CodeBook.md".    
4) "tidy-data.txt": The final, tidy data set created by "run_analysis.R"


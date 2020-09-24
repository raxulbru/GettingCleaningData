---
title: "CodeBook"
author: ''
date: ''
output:
  html_document: default
  pdf_document: default
---

## General Information

run_analysis.R performs actions on the provided data (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) to create a tidy data set called "tidy-data.txt". This data set is a table of dimensions 180 x 68. The 180 rows correspond to the 30 volunteers of the study times the 6 activities under which each of them was recorded. The 68 columns are the following: Column 1, named "subject", corresponds to the volunteer ID. Column 2, named "activity", corresponds to the activities that each subject was allowed to performed. The rest of the columns correspond to several variables that were measured in the experiment for each subject and activity. The name of these variables are listed below.

## Transformations performed by the script

1) Before starting the actions on data, the working directory is set.
2) Download the ".zip" data file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
3) Unzip the data file, which gives us a directory called "UCI HAR Dataset" that contains the data.
4) Read the relevant files of the data set: "activity_labels.txt", "features.txt", "subject_train.txt", "subject_test.txt", "y_train.txt", "y_test.txt", X_train.txt", and "X_test.txt".
5) Merge all *_train.txt and *_test.txt files into one data set called "data", whose dimensions are 10299 x 563. The 10299 rows correspond to the observations of the experiment, while the 563 columns correspond to variable "subject", variable "activity", and the 561 measured features/variables in the experiment.
6) In data set "data", name the 561 features according to its name listed in file "features.txt"
7) Extract from "data" a new data set, called "extracted", whose variables are "subject","activity", and all the measured variables/features in the experiment that are related to means and standard deviations. It turns out that there are 66 variables/features containing mean() or std(), which gives us a data frame of dimensions 10299 x 68.
8) Since the row data provides only a numerical ID (ranging from 1 to 6) for the 6 activities each subject can perform, replace in "extracted" the activity id (the numbers from 1 to 6) with the corresponding activity names (which are listed in "activity_labels.txt").
9) Appropriately label the names of the 66 measured variables of "extracted".
10) Transform "extracted" into a tidy data set that contains the average of each of the 66 features for each subject and activity. The result is the "tidy-data.txt" file described above in the general information section. To do this, using library "dpltr", sort "extracted" by "subject" first and subsequently by "activity" (this step allows to nicely sort the final output). Next, group by "subject" and "activity" and summarise_all the rest of the variables using "mean". This gives us data frame "data_tidy". Finally, write "data_tidy" into a text file called "tidy-data.txt" using write.table.

## Information about the variables of the tidy data set

All 66 measured variables of the tidy data set start with either Time or Frequency, in relation to time domain (data are recorded at a constant rate of 50Hz) or frequency domain (after a fast fourier transform of the recorded data). In the experiment, the sensor acceleration signal, which has gravitational and body motion components, is separated into body and gravity acceleration signals (hence, the words "Body" and "Gravity" in the names of the variables listed below). The acceleration and angular velocity were derived in time to obtain Jerk signals and the corresponding magnitudes were calculated using the Euclidean norm. This explanation should be sufficient to understand each variable from its name.

$\underline{Units}$ of the measured variables: All variables that contain "Acceleration" in their name are measured in standard gravity units 'g'. All variables that contain "AngularVelocity" in their name are measured in radians/second.

"subject" and "activity" are somehow different from the rest of variables, in the sense that they do not correspond to measures derived from the accelerometers and gyroscopes of the experiment. "subject": ID of the 30 volunteers of the experiment, within an age bracket of 19-48 years. "activity": The 6 possible activities are WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING.

For more information, please take a look at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

## List of the variables of the tidy data set

1) "subject"
2) "activity"                                               
3) "TimeBodyAccelerationMeanX"
4) "TimeBodyAccelerationMeanY"                                 
5) "TimeBodyAccelerationMeanZ"
6) "TimeBodyAccelerationStandardDeviationX"                    
7) "TimeBodyAccelerationStandardDeviationY"
8) "TimeBodyAccelerationStandardDeviationZ"                    
9) "TimeGravityAccelerationMeanX"
10) "TimeGravityAccelerationMeanY"                              
11) "TimeGravityAccelerationMeanZ"
12) "TimeGravityAccelerationStandardDeviationX"                 
13) "TimeGravityAccelerationStandardDeviationY"
14) "TimeGravityAccelerationStandardDeviationZ"                 
15) "TimeBodyAccelerationJerkMeanX"
16) "TimeBodyAccelerationJerkMeanY"                             
17) "TimeBodyAccelerationJerkMeanZ"
18) "TimeBodyAccelerationJerkStandardDeviationX"                
19) "TimeBodyAccelerationJerkStandardDeviationY"
20) "TimeBodyAccelerationJerkStandardDeviationZ"                
21) "TimeBodyAngularVelocityMeanX"
22) "TimeBodyAngularVelocityMeanY"                              
23) "TimeBodyAngularVelocityMeanZ"
24) "TimeBodyAngularVelocityStandardDeviationX"                 
25) "TimeBodyAngularVelocityStandardDeviationY"
26) "TimeBodyAngularVelocityStandardDeviationZ"                 
27) "TimeBodyAngularVelocityJerkMeanX"
28) "TimeBodyAngularVelocityJerkMeanY"                          
29) "TimeBodyAngularVelocityJerkMeanZ"
30) "TimeBodyAngularVelocityJerkStandardDeviationX"             
31) "TimeBodyAngularVelocityJerkStandardDeviationY"
32) "TimeBodyAngularVelocityJerkStandardDeviationZ"
33) "TimeBodyAccelerationMagnitudeMean"
34) "TimeBodyAccelerationMagnitudeStandardDeviation"            
35) "TimeGravityAccelerationMagnitudeMean"
36) "TimeGravityAccelerationMagnitudeStandardDeviation"         
37) "TimeBodyAccelerationJerkMagnitudeMean"
38) "TimeBodyAccelerationJerkMagnitudeStandardDeviation"        
39) "TimeBodyAngularVelocityMagnitudeMean"
40) "TimeBodyAngularVelocityMagnitudeStandardDeviation"         
41) "TimeBodyAngularVelocityJerkMagnitudeMean"
42) "TimeBodyAngularVelocityJerkMagnitudeStandardDeviation"     
43) "FrequencyBodyAccelerationMeanX"
44) "FrequencyBodyAccelerationMeanY"                            
45) "FrequencyBodyAccelerationMeanZ"
46) "FrequencyBodyAccelerationStandardDeviationX"               
47) "FrequencyBodyAccelerationStandardDeviationY"
48) "FrequencyBodyAccelerationStandardDeviationZ"               
49) "FrequencyBodyAccelerationJerkMeanX"
50) "FrequencyBodyAccelerationJerkMeanY"                        
51) "FrequencyBodyAccelerationJerkMeanZ"
52) "FrequencyBodyAccelerationJerkStandardDeviationX"           
53) "FrequencyBodyAccelerationJerkStandardDeviationY"
54) "FrequencyBodyAccelerationJerkStandardDeviationZ"           
55) "FrequencyBodyAngularVelocityMeanX"
56) "FrequencyBodyAngularVelocityMeanY"                         
57) "FrequencyBodyAngularVelocityMeanZ"
58) "FrequencyBodyAngularVelocityStandardDeviationX"            
59) "FrequencyBodyAngularVelocityStandardDeviationY"
60) "FrequencyBodyAngularVelocityStandardDeviationZ"            
61) "FrequencyBodyAccelerationMagnitudeMean"
62) "FrequencyBodyAccelerationMagnitudeStandardDeviation"       
63) "FrequencyBodyAccelerationJerkMagnitudeMean"
64) "FrequencyBodyAccelerationJerkMagnitudeStandardDeviation"   
65) "FrequencyBodyAngularVelocityMagnitudeMean"
66) "FrequencyBodyAngularVelocityMagnitudeStandardDeviation"    
67) "FrequencyBodyAngularVelocityJerkMagnitudeMean"
68) "FrequencyBodyAngularVelocityJerkMagnitudeStandardDeviation"


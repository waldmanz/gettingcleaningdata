Code Book for Coursera Getting and Cleaning Data Course Project
========================================================

This document describes the raw dataset and tidy dataset generated for this project, 
as well as the steps used to obtain the tidy dataset.


Introductory Notes
---------------------------


Raw Dataset
---------------------------

The raw dataset is the Human Activity Recognition Using Smartphones Dataset
Version 1.0.

The full citation of the dataset is as follows:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
[www.smartlab.ws](www.smartlab.ws)

The data was downloaded from 
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 

A full description of the raw data can be found in the README.txt document via the above link.

A summary is included below. 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

### For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

### The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

### Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.



Tidy Dataset
----------------------------

The final dataset tidy_dataset.txt, is a space delimited text file with a header row.  It contains 35 observations of 68 variables.

The first      
The final dataset contains the following variables

Subject - integer from 1 to 30 representing subject number
Activity Label - character -  containing one of 6 descriptions of what subject was doing at the time of measures

The remaining 66 variables 

The following name convention is used for the remaining variables.

- All start with the word "Average" (the data represent averages for a given subject/activity)
- The first letter after average is "t" or "f", for data in the time or frequency domain respectively
- The next part of the name describes the type of measurement.
	- BodyAcc
	- GravityAcc
	- BodyAccJerk
	- BodyGyro
	- BodyGyroJerk
	- BodyAccMag
	- GravityAccMag
	- BodyAccJerkMag
	- BodyGyroMag
	- BodyGyroJerkMag
- The next component is mean or std, depending on whether the data is mean or standard deviation data from the raw dataset
- Finally, where data is triaxial, a letter X, Y, or Z represents the axis of the data.

	



Steps Used to Generate Tidy Dataset
-----------------------------

1. Read data with labels for activities and features

2. Create index to be used later to select mean and std features

3. Clean feature names by removing () and converting - to ()
        
4. Read subject train and test data (as factor) and combine

5. Read y data (activity number) for train and test data and combine

6. Read X data for train and test and combine

7. Use data from features data frame to assign column names to features

8. Subset X data to select columns with mean and std data

9. Use merge to add activity names by "Activity_Number"

10. Create data frame with subject, activity number, activity label

11. Create vector of new column names for 2nd tidy data frame.  Add "Average" to the old column names (cols 4 through 69)

12. Melt and recast tidy_frame1 to create new frame with data means

13. Order by Subject and Activity_Number

14. Remove Activity_Number column (redundant with Activity_Label)

15.  Output result to space-delimited file named tidy_dataset.txt



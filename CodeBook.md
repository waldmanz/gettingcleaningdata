Code Book for Coursera Getting and Cleaning Data Course Project
========================================================

This document describes the raw dataset and tidy dataset for the project, 
and the script used to generate the tidy dataset.

Raw Dataset
---------------------------

The raw dataset is the Human Activity Recognition Using Smartphones Dataset
Version 1.0.  The reference is provided at the bottom of this document.

The data was downloaded from 
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) on May 16, 2014.

A full description of the raw data can be found in the README.txt document via the above link.  A summary is included below. 

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

> For each record it is provided:

> - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
> - Triaxial Angular velocity from the gyroscope. 
> - A 561-feature vector with time and frequency domain variables. 
> - Its activity label. 
>- An identifier of the subject who carried out the experiment.
> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

> The dataset includes the following files:

> 'README.txt'
> 'features_info.txt': Shows information about the variables used on the feature vector.
> 'features.txt': List of all features.
> 'activity_labels.txt': Links the class labels with their activity name.
> 'train/X_train.txt': Training set.
> 'train/y_train.txt': Training labels.
> 'test/X_test.txt': Test set.
> 'test/y_test.txt': Test labels.

> The following files are available for the train and test data. Their descriptions are equivalent. 

> 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

> 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

> 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

> 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

> Notes: 
> - Features are normalized and bounded within [-1,1].
> - Each feature vector is a row on the text file.



Tidy Dataset
----------------------------

The output dataset tidy_dataset.txt, is a space-delimited text file with a header row.  It contains 35 observations of 68 variables.

The tidy dataset contains the following variables

Subject: an integer representing subject number (range 1-30)
Activity Label: a string containing one of 6 descriptor of subject's activity at the time of measurements

The remaining 66 variables represented a subset of the 561 item original feature vector, where features were selected for inclusion in the final dataset if they represented either mean or standard deviation data in the initial dataset.  The data in the final dataset are split by each subject and activity label, and averaged over the split dataset.  Both training and test data were combined to form the final tidy dataset.

The following name convention is used for variables 3-68 in the tidy dataset.

- All start with the word "Average" 
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

3. Clean feature names by removing () and converting - to _
        
4. Combine subject train and test data. 

5. Combine y data (activity number) for train and test data

6. Combine X data for train and test data

7. Use data from features.txt to assign column names to features

8. Keep features that contain either mean() or std() in their names.

9. Merge to add activity names to data.  

10. Create interim data frame with subject, activity number, activity label

11. Create vector of new column names for tidy data frame.  Add "Average" to the old column names (cols 4 through 69)

12. Melt and recast to create new dataset with data means

13. Order tidy dataset by Subject and Activity_Number

14. Remove Activity_Number column (redundant with Activity_Label)

15.  Output result to space-delimited file named tidy_dataset.txt


Reference raw data used for this project:

> Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012 [www.smartlab.ws](www.smartlab.ws)

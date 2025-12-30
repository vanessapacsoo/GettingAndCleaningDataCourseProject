================================================================================
CodeBook.md
================================================================================

Dataset
================================================================================
This dataset comes from the UCI Human Activity Recognition Using Smartphones study.

Variables
================================================================================
- subject: subject ID (1–30)
- activity: Type of activity performed 
  (1=WALKING, 2=WALKING_UPSTAIRS, 3=WALKING_DOWNSTAIRS, 4=SITTING, 5=STANDING, 6=LAYING)
- Measurements: Mean and standard deviation of sensor signals

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Transformations
================================================================================
1. Merged the training and the test sets to create one data set.
2. Extracted only the measurements on the mean and standard deviation for each measurement. 
3. Used descriptive activity names to name the activities in the data set
4. Appropriately labeled the data set with descriptive variable names. 
5. From the data set in step 4, created a second, independent tidy data set with the average of each variable for each activity and each subject.
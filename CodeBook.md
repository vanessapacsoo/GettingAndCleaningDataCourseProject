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
- Measurements: Mean and standard deviation of sensor signals

Transformations
================================================================================
1. Merged the training and the test sets to create one data set.
2. Extracted only the measurements on the mean and standard deviation for each measurement. 
3. Used descriptive activity names to name the activities in the data set
4. Appropriately labeled the data set with descriptive variable names. 
5. From the data set in step 4, created a second, independent tidy data set with the average of each variable for each activity and each subject.
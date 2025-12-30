library(dplyr)

#Load test data
subject_test <- read.table("test/subject_test.txt") #Subject IDs for test
X_test <- read.table("test/X_test.txt") #Test set
Y_test <- read.table("test/y_test.txt") #Test label

#Load train data
subject_train <- read.table("train/subject_train.txt") #Subject IDs for training
X_train <- read.table("train/X_train.txt") #Training set
Y_train <- read.table("train/y_train.txt") #Training label

#Load features names
features <- read.table("features.txt")

#Load activity labels
activity_labels <- read.table("activity_labels.txt", col.names = c("id", "activity"))

################################################################################
# 1. Merging the training and the test sets to create one data set.
################################################################################

#Combine the test and training datasets
combined_data <- bind_rows(X_test, X_train)

#Combine the activity labels
activity_data <- bind_rows(Y_test, Y_train)

#Combine the subject labels
subject_data <- bind_rows(subject_test, subject_train)

################################################################################
# 2. Extracting only the measurements on the mean and standard deviation for 
# each measurement. 
################################################################################

#Get column index for mean and standard deviation
mean_std_col <- grep("-(mean|std)\\(\\)", features$V2)

#Subset combined data to include these columns
mean_std_data <- combined_data[, mean_std_col]

################################################################################
# 3. Using descriptive activity names to name the activities in the data set
################################################################################

#Rename columns with features names
colnames(mean_std_data) <- features$V2[mean_std_col]

################################################################################
# 4. Appropriately labels the data set with descriptive variable names. 
################################################################################

#Combine subject, activity, mean and std dev measurements
tidy_data <- cbind(subject_data, activity_data, mean_std_data)
colnames(tidy_data)[1:2] <- c("subject", "activity")

################################################################################
# 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
################################################################################

# Create the second, independent tidy data set
tidy_data_avg <- tidy_data %>%
  group_by(subject, activity) %>%
  summarise_all(list(mean))

# Write the tidy data to a text file
write.table(tidy_data_avg, "tidy_data_avg.txt", row.names = FALSE)

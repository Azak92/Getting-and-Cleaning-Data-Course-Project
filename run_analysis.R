run_analysis <- function(){
  # read labels and features from respective files
  labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
  features <- read.table("./UCI HAR Dataset/features.txt")
  
  # read test data
  subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
  X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
  y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
  
  # read train data
  subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
  X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
  y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
  
  #combine train and test tables into one table for each
  test <- cbind(y_test, subject_test, X_test)
  train <- cbind(y_train, subject_train, X_train)
  
  # combine two tables into one full table
  full_data <- rbind(test, train)
  
  # put names of activities to first column of full_data
  names(labels) <- c("ActivityIndex", "ActivityName")
  full_data$V1 <- labels$ActivityName[full_data$V1]
  
  # rename first and second columns of full_data
  colnames(full_data)[1:2] <- c("Activity", "Subject")
  
  # rename features columns in full_data
  # get names of features first
  features_names <- c(as.character(features$V2))
  # skip first 2 columns as we already renamed them
  colnames(full_data)[3:563] <- features_names
  
  # only get columns that we need
  subset_col <- grep("Activity|Subject|Mm|ean|std", names(full_data), value = FALSE)
  full_data_subset <- full_data[subset_col]
  
  # rename columns into descriptive variables
  # get names of our subset
  names_subset <- names(full_data_subset)
  # rename columns if needed
  names_subset <- gsub("^t", "time", names_subset)
  names_subset <- gsub("^f", "frequency", names_subset)
  names_subset <- gsub("^anglet", "angleTime", names_subset)
  names_subset <- gsub("mean", "Mean", names_subset)
  names_subset <- gsub("std", "Std", names_subset)
  names_subset <- gsub("gravity", "Gravity", names_subset)
  # apply new names to our subset
  colnames(full_data_subset) <- names_subset
  
  # create new set with mean for each value split by activity and by subject
  tidy_data_set <- summarise_all(group_by(full_data_subset, Activity, Subject), lst(mean))
  
  # save dataset to file
  write.table(tidy_data_set, file = "tidyDataSet.txt", row.names = FALSE)
  
  
  
}


# script for converting raw data to final tidy dataset for course project

#working directories for different machines
#setwd("~/Dropbox/DataScience/DataCleaning/courseproject/gettingcleaningdata")
#setwd("C:/Users/zwaldman/Dropbox/DataScience/DataCleaning/courseproject/gettingcleaningdata")

library(plyr)
library(reshape2)

### read data with labels for activities and features
activities <- read.table("./UCI HAR Dataset/activity_labels.txt",
                       col.names = c("Activity_Number", "Activity_Label"),
                       colClasses = c("numeric", "factor"))

features <- read.table("./UCI HAR Dataset/features.txt",
                        col.names = c("Feature_Number", "Feature_Name"),
                        stringsAsFactors = FALSE)

# create index to be used later to select mean and std features
# note \\ used to escape open and closed parenthesis
index <- grep("mean\\(\\)|std\\(\\)", features$Feature_Name, ignore.case = TRUE)

# clean feature names by removing () and converting - to ()
clean_names <- gsub("\\(\\)", "", features$Feature_Name)
clean_names <- gsub("-","_", clean_names)
features$Feature_Name <- clean_names
        
### read subject train and test data and combine
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",
                            col.names = "Subject")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",
                           col.names = "Subject")
subject_combined <- rbind(subject_train, subject_test)


# read y data (activity number) for train and test data and combine
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt",
                     col.names = "Activity_Number")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt",
                     col.names = "Activity_Number")
y_combined <- rbind(y_train, y_test)


# read X data for train and test and combine (takes a while)
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
X_combined <- rbind(X_train, X_test)

# use data from features data frame to assign column names to features
names(X_combined) <- features$Feature_Name

# subset X data to select columns with mean and std data
X_combined_mean_std <- X_combined[,index]

# use merge to add activity names (implicitly, by="Activity_Number",
#   because this is the common column name)
#   all.x = TRUE gives output of length y_test

y_combined_merged <- merge(y_combined, activities, all.x = TRUE)

# create data frame with subject, activity number, activity label
tidy_frame1 <- data.frame(subject_combined, y_combined_merged)
tidy_frame1 <- data.frame(tidy_frame1, X_combined_mean_std)

# create vector of new column names for 2nd tidy data frame
# Add "Average" to the old column names (cols 4 through 69)
newnames <- vector("character", 69)   # empty character vector
newnames[1:3] <- colnames(tidy_frame1)[1:3]
newnames[4:69] <- paste("Average", colnames(tidy_frame1)[4:69])

# melt and recast tidy_frame1 to create new frame with data means
dmelt2 <- melt(tidy_frame1, id.vars = c("Subject","Activity_Number",
                                        "Activity_Label"))
casted_frame2 <- dcast(dmelt2, Subject + Activity_Number + Activity_Label
                       ~ variable, mean)
colnames(casted_frame2) <- newnames # use correct column names

# Use arrange() from plyr to order by Subject and Activity_Number
# first need to convert Subject and Activity Number 
tidy_frame2 <- arrange(casted_frame2, Subject, Activity_Number)

# Remove Activity_Number column (redundant with Activity_Label)
tidy_frame2 <- subset(tidy_frame2, select = -Activity_Number)

# Output result to space or comma-delimited file
write.table(tidy_frame2, "tidy_dataset.txt", row.names = FALSE)
# write.csv(tidy_frame2, "tidy_dataset.csv", row.names = FALSE)



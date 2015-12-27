library(plyr)
# Step 1:Merges the training and the test sets to create one data set.

# read all the text into enviroment
X_test <- read.table("test/X_test.txt",quote="\"", comment.char="")
X_train <- read.table("train/X_train.txt", quote="\"", comment.char="")
Y_test <- read.table("test/Y_test.txt", quote="\"", comment.char="")
Y_train <- read.table("train/Y_train.txt", quote="\"", comment.char="")
subject_test <- read.table("test/subject_test.txt", quote="\"", comment.char="")
subject_train <- read.table("train/subject_train.txt", quote="\"", comment.char="")

# put them together
X_data<- rbind(X_test,X_train)
Y_data<- rbind(Y_test,Y_train)
subject_data<- rbind(subject_test,subject_train)

# Step 2:Extracts only the measurements on the mean and standard deviation for each measurement. 

# read the colname of x 
features <- read.table("features.txt",quote="\"")
featurenames <- as.vector(features[,2])
colnames(X_data) <-featurenames

#measurements on the mean and standard deviation 
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])
X_data<- X_data[,mean_and_std_features]


# Step 3:Uses descriptive activity names to name the activities in the data set

# read the name of activity 
activities <- read.table("activity_labels.txt")

# update values with correct activity names
Y_data[, 1] <- activities[Y_data[, 1], 2]

# correct column name
names(Y_data) <- "activity"

# Step 4:Appropriately labels the data set with descriptive variable names. 
# name the subject colums
names(subject_data) <- "subject"

# bind all the data in a single data set
all_data <- cbind(subject_data,Y_data, X_data)

# Step 5:From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# average the data
averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 3:68]))
# get the tidy data
write.table(averages_data, "averages_data.txt", row.name=FALSE)



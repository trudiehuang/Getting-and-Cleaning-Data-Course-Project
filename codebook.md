
#data
the X_train   X_test   is the basic data,including the featrues from the features_info
the Y_train  Y_test indicate the activity  which we can find the details in activity_labels

#variables
read the  X_train  Y_train X_test  Y_test subject_train subject_test  features  into the variables in the same name 

#transformations 
1.combine the X_train   X_test into X_data  and Y_train  Y_test into Y_data , subject_train subject_test into subject_data.
2.name the x_train's colname by features and extracts only the measurements on the mean and standard deviation for each measurement. 
3.use activity_labels to name the activities in the Y_data
4.combine the subject_data,y_data & x_data and get the average of each variable for each activity and each subject as ‘average_data"

#Set the working directory
 setwd("C:/Users/Admin/Documents/Coursera/Data Science Specialization/Getting and Cleaning Data/Assignment/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")

#Import the activity labels and assign it its own variable names
 activity_labels <-read.table("activity_labels.txt",header=FALSE)
 colnames(activity_labels) <- c('activity_No', 'activity_Desc')

#Import the feature labels
 features <-read.table("features.txt",header=FALSE)

#Import the subject identifiers for the training and test data sets and name the variables accordingly
 subject_train<-read.table("train/subject_train.txt",header=FALSE)
 colnames(subject_train)  = "subject_No"
 subject_test<-read.table("test/subject_test.txt",header=FALSE)
 colnames(subject_test) = "subject_No"

#Import training data and test data - call training labels column "activity_No" and assign feature vector as column header for dataset
 X_train<-read.table("train/X_train.txt",header=FALSE)
 colnames(X_train) = features[,2]
 y_train<-read.table("train/y_train.txt",header=FALSE)
 colnames(y_train) = "activity_No"
 X_test<-read.table("test/X_test.txt",header=FALSE)
 colnames(X_test) = features[,2]
 y_test<-read.table("test/y_test.txt",header=FALSE)
 colnames(y_test) = "activity_No"

#create training set and test set by column-binding subject, dataset and labels
 train=cbind(subject_train,X_train,y_train)
 test=cbind(subject_test,X_test,y_test)

#combine training and test sets using a row-bind
 dataset=rbind(train,test)

#create a vector of column names 
 datasetVarNames = colnames(dataset)

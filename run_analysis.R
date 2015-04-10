## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("reshape2")) {
  install.packages("reshape2")
}

require("data.table")
require("reshape2")


## Step 1: Read data

# read train data
trainXdata <- read.table("train/X_train.txt")
trainYdata <- read.table("train/y_train.txt",col.names = "label")
trainSubjects<-read.table("train/subject_train.txt",col.names = "subject")

# read test data
testXdata <- read.table("test/X_test.txt")
testYdata <- read.table("test/y_test.txt",col.names = "label")
testSubjects<-read.table("test/subject_test.txt",col.names = "subject")

# read features
features<-read.table("features.txt",strip.white=TRUE,stringsAsFactors=FALSE)[,2]



## Step 2: Merge train and test data
Xdata<-rbind(trainXdata,testXdata)
Ydata<-rbind(trainYdata,testYdata)
Subjects<-rbind(trainSubjects,testSubjects)



## Step 3: Extract only the measurements on the mean and standard deviation for each measurement.
extract_features <- grepl("mean|std", features)
extract_features_names<-features[extract_features]
extract_Xdata <- Xdata[,extract_features]
colnames(extract_Xdata)<-extract_features_names

data<-cbind(Subjects,Ydata,extract_Xdata)

## Step 4: Read the activity names and use activity names to name the activities in the data set.

# read the activities
labels <-read.table("activity_labels.txt", stringsAsFactors=FALSE)

# Appropriately labels the data set with descriptive activity names.
data$label<-labels[data$label,2]



## Step 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidydata<-aggregate(data[,3:ncol(data)],by=list(subject = data$subject,label = data$label), mean)


## Step 6: Write the data to tidyData.txt file for upload
write.table(format(tidydata, scientific=T), "tidyData.txt",row.names=F, col.names=F, quote=2)

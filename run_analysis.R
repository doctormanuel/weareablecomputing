# Download and unzip data
url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipfile="./dataset.zip"
download.file(url,zipfile)
unzip(zipfile)

# Files to be read
trainxfile="./UCI HAR Dataset/train/X_train.txt"
trainyfile="./UCI HAR Dataset/train/y_train.txt"
subjtrainfile="./UCI HAR Dataset/train/subject_train.txt"
testxfile="./UCI HAR Dataset/test/X_test.txt"
testyfile="./UCI HAR Dataset/test/y_test.txt"
subjtestfile="./UCI HAR Dataset/test/subject_test.txt"
featuresfile="./UCI HAR Dataset/features.txt"
activitiesfile="./UCI HAR Dataset/activity_labels.txt"

# Read descriptor files
activities=read.table(activitiesfile,col.names=c("index","activityname"))
features=read.table(featuresfile,col.names=c("index","featurename"))
# Remove special characters from label names
features$featurename=gsub("\\(","",features$featurename)
features$featurename=gsub("\\)","",features$featurename)
features$featurename=gsub("-","",features$featurename)
features$featurename=gsub(",","",features$featurename)
# And capitalize first letter of mean and std for better reading
features$featurename=gsub("mean","Mean",features$featurename)
features$featurename=gsub("std","Std",features$featurename)

# Read measurementdata
xtrain=read.table(trainxfile,col.names=features$featurename)
xtest=read.table(testxfile,col.names=features$featurename)

# Read activities and subject identifier
ytrain=read.table(trainyfile,col.names = "actindex")
subjtrain=read.table(subjtrainfile,col.names="subject")
ytest=read.table(testyfile,col.names = "actindex")
subjtest=read.table(subjtestfile,col.names="subject")

# Combines test and train datasets
x=rbind(xtrain,xtest)
y=rbind(ytrain,ytest)
subj=rbind(subjtrain,subjtest)

#Combines quantitative variables (x), activity indices (y) and subjects
data=cbind(x,y,subj)

# Find mean and std measurements
imeanstd=grep("*[Mm]ean*|*[Ss]td*",features$featurename)
labelsmeanstd=features$featurename[imeanstd]

# Extract the mean and std measurements only (and actindex and subject)
library(dplyr)
data=select(data,c(imeanstd,actindex,subject))

# Update activities variable with descriptive activity names and rename variable
data$actindex=activities$activityname[data$actindex]
data=rename(data,activity=actindex)

# Convert activity name and subject to factors
data$subject=as.factor(data$subject)
data$activity=as.factor(data$activity)

# Create factor variable with combinations of activity and subject
combfact=with(data,interaction(as.factor(activity),as.factor(subject)))
data=cbind(data,combfact)

# Create tidy data.frames
tidydata=data.frame()
tidyactivity=list()
tidysubject=list()

# Calculate means and specific value for activity and subject
for (i in unique(combfact)){
  tidydata=rbind(tidydata,sapply(data[data$combfact==i,1:86],mean))
  tidyactivity=rbind(tidyactivity,as.character(data[data$combfact==i,87][1]))
  tidysubject=rbind(tidysubject,data[data$combfact==i,88][1])
}

# Combine mean values with activity names an subjects
tidydata=cbind(tidydata,tidyactivity,tidysubject)

# Reassign original variable names to tidydata
tidydata=setNames(tidydata,names(data[1:88]))

# Write tidy data to file
write.table(apply(tidydata,2,as.character),"tidydata.txt",row.name=FALSE)
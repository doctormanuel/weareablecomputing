### Introduction

This repositoty contains my submission for the final Course Project
assignment in the course Getting and Cleaning Data.

### Files

1. "README.md": This file, contains a description of the repository
2. "CodeBook.md": A code book describing the variables in the dataset
   and the processes applied to them for cleaning.
3. "run_analysis.R": An R script used for cleaning the data
4. "tidydata.txt": A text file containing the cleaned data

### Script details
"run_analysis.R" performs a series of steps to process the data:
1. Downloads and unzips the data
2. Reads files with descriptor variables (features and activities)
3. Process names of features to be used late as variable names
4. Reads measurement files (test and train) into a data frame
   using the features as the variable names.
5. Reads activity names and subject identifiers
6. Combines train and test datasets
7. Combines the datasets containing the measurements variables,
   the activity indices and the subject identifiers
8. Finds variables corresponding to mean and standard devitation
   and extracts them from the dataset.
9. Substitues the activity indices for worded activity descriptors
10. Converts activity and subject to factor within the data frame
11. Creates a combinatory factor with activity and subject
12. Creates new tidy data frame and stores in it a mean of each of the
    variables for each of the combinations of activity and subject.
13. Writes new tidy dataset to file


### Review Criteria
1. The submitted data set is tidy.
2. The Github repo contains the required scripts.
3. GitHub contains a code book that modifies and updates the available
   codebooks with the data to indicate all the variables and summaries
   calculated, along with units, and any other relevant information.
4. The README that explains the analysis files is clear and understandable.
5. The work submitted for this project is the work of the student who submitted it.

### Assignment Instructions

The purpose of this project is to demonstrate your ability to collect,
work with, and clean a data set.
The goal is to prepare tidy data that can be used for later analysis.
You will be graded by your peers on a series of yes/no questions related
to the project. You will be required to submit:
1. a tidy data set as described below
2. a link to a Github repository with your script for performing the analysis
3. a code book that describes the variables, the data, and any transformations
   or work that you performed to clean up the data called CodeBook.md. You
   should also include a README.md in the repo with your scripts. This repo
   explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable
computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and
Jawbone Up are racing to develop the most advanced algorithms to attract new
users. The data linked to from the course website represent data collected from
the accelerometers from the Samsung Galaxy S smartphone. A full description is
available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the
   average of each variable for each activity and each subject.

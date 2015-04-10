For creating a tidy data set of wearable computing data originally from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Files in this repo

    README.md -- General introduction
    CodeBook.md -- codebook describing variables, the data and transformations
    run_analysis.R -- actual R code

run_analysis.R goals

You should create one R script called run_analysis.R that does the following. 
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


It should run in a folder of the Samsung data. The script assumes that it is in the working directory with the following files and folders:

    activity_labels.txt
    features.txt
    test/
    train/

The final output is created in working directory with the name of tidyData.txt

Note: the R script is built to run without including any libraries for the purpose of this course.
run_analysis.R walkthrough

It follows the goals step by step.

    Step 1:
        Read all the test, training and feature files.

    Step 2:
        Merge train and test data

    Step 3:
        Extract only the measurements on the mean and standard deviation for each measurement.
        

    Step 4:
        Read  activity names and use activity names to name the activities in the data set.

    Step 5:
        Create a tidy data frame by calculating the mean of each variable for each combination of subject and label. It's done by aggregate() function

    Final step:
        Write the data to tidyData.txt file for upload, formatted similarly to the original files.


#Getting and Cleaning Data Course Project
===================

This describes how the project script works.

*The first block of code reads and compiles the "test" data and tags all the observations as "test" observations.

*The second block of code reads and compiles the "train" data and tags all the observations as "train" observations.

*The third block of data compiles the "test" and "train" data sets and merges to get the descriptive activity labels.

*The fourth block of data creates a list of labels to be applied to the data variables.

*The fifth block of data creates a list of column indices that will only keep the desired variables.

*The next line of code creates a set based on the column index in the previous step.

*The next line of code creates a set which calculates mean and std averages.  This step also mucks up some of the variable labels.

*The final block of data fixes the variable labels and creates a .txt file of the resulting tidy data set.

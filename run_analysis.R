
#this block reads and compiles the "test" data.  it also tags the observations as "test" observations
subjectTest <- read.table("./subject_test.txt")
resultsTest <- read.table("./X_test.txt")
activityTest <- read.table("./y_test.txt")
dataTest <- cbind(subjectTest, "Test", activityTest, resultsTest)

#this block reads and compiles the "train" data.  it also tags the observations as "train" observations
subjectTrain <- read.table("./subject_train.txt")
resultsTrain <- read.table("./X_train.txt")
activityTrain <- read.table("./y_train.txt")
dataTrain <- cbind(subjectTrain, "Train", activityTrain, resultsTrain)

##this block compiles the "test" and "train" data sets.  it also merges to get descriptive activity labels
dataMerge0 <- rbind(dataTest, setNames(dataTrain, names(dataTest)))
activityLabel <- read.table("./activity_labels.txt")
dataMerge <- merge(dataMerge0, activityLabel, by.x = 3, by.y = 1, all.x = FALSE, all.y = FALSE)

#this block creates a list of labels that are applied to "dataMerge"
variableLabel0 <- read.table("./features.txt")
variableLabel1 <- t(variableLabel0)
variableLabel <- c("ActivityNumber", "Subject", "DataType", variableLabel1[2,], "Activity")
names(dataMerge) <- variableLabel

##this block creates a list of column indices that will only keep the "Subject", "DataType", and "Activity" variables as well as variables which calculate a mean or std
vectorList <- c(2, 3, 565, grep("Mean", variableLabel), grep("mean", variableLabel), grep("std", variableLabel))

##this create a set based on the column index in the previous step.
dataFinal <- dataMerge[, vectorList]

##this creates a set which calculats mean and std averages for each "Subject", "DataType", and "Activity" combination
dataTidy <- aggregate(dataFinal [, 4:89], list(dataFinal$Subject, dataFinal$DataType, dataFinal$Activity), mean)

##the aggregation in the prior step mucked up some of the labels; this fixes that and creates a .txt file of the resulting data set
variableLabel <- c("Subject", "DataType", "Activity", names(dataTidy[,4:89]))
names(dataTidy) <- variableLabel
write.table(dataTidy, file = "dataTidy.txt", row.names = FALSE)




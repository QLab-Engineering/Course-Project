#To properly run this R script, the database folder "UCI HAR Dataset" 
  #must be located in the working directory

#Creating dataframes related to "test"
testdatalink <- "UCI HAR Dataset/test/X_test.txt"
dbtest <- read.table(testdatalink, numerals = "no.loss")
subjectTestLink <- "UCI HAR Dataset/test/subject_test.txt"
subjectTest <- read.table(subjectTestLink)
actiTestLink <- "UCI HAR Dataset/test/y_test.txt"
actiTest <- read.table(actiTestLink)

#Creating dataframes related to "train"
traindatalink <- "UCI HAR Dataset/train/X_train.txt"
dbtrain <- read.table(traindatalink, numerals = "no.loss")
subjectTrainLink <- "UCI HAR Dataset/train/subject_train.txt"
subjectTrain <- read.table(subjectTrainLink)
actiTrainLink <- "UCI HAR Dataset/train/y_train.txt"
actiTrain <- read.table(actiTrainLink)

#Adding subject and activity variables to both "test" and "train" databases
AddVarTest <- cbind(subjectTest, actiTest)
dbtest <- cbind(AddVarTest, dbtest)
AddVarTrain <- cbind(subjectTrain, actiTrain)
dbtrain <- cbind(AddVarTrain, dbtrain)

#Merging the "test" and "train" dataframes
db <- rbind.data.frame(dbtrain, dbtest)

#Creating a column header
featurelink <- "UCI HAR Dataset/features.txt"
features <- read.table(featurelink, colClasses = "character")
features <- features[, "V2"]
features <- features %>% append("activityid", after = 0) %>% append("subject", after = 0)
names(db) <- features

#Identify and remove duplicate variables
idDup <- which(duplicated(colnames(db)))
  #Based on the features.txt file, none of those variables are means or std
db <- db[,-idDup]

#Select mean and standard deviation of each measurement
dbMeanStd <- db %>% select(subject, activityid, matches("mean|std", ignore.case = FALSE)) %>% select(-matches("meanFreq", ignore.case = FALSE))

#Add activity names in the database
activityLabelLink <- "UCI HAR Dataset/activity_labels.txt"
activityLabel <- read.table(activityLabelLink, col.names = c("activityid", "activity"))
dbMeanStd <- merge(dbMeanStd, activityLabel, by = "activityid")
dbMeanStd$activityid <- NULL
dbMeanStd <- dbMeanStd %>% select(1, length(dbMeanStd), everything()) %>% arrange(subject, activity)

#Rename the variables name to be more descriptive
colnames(dbMeanStd) <- colnames(dbMeanStd) %>% tolower %>% 
  {gsub("\\()","",.,)} %>% {sub("-mean"," mean",.,)} %>% 
  {sub("-std"," std",.,)} %>% {sub("bodybody","body",.,)} %>% 
  {sub("-","",.,)}

#Create a data set with the average of each variable for each activity and each subject
dbSum <- dbMeanStd %>% group_by(subject, activity) %>% summarize_all(mean)

#Write databases to file
write.table(dbSum, file = "run_analysis.txt", sep = " ", row.names = FALSE, col.names = TRUE)
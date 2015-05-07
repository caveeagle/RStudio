
require("reshape2")

###################################

basedir <- file.path(getwd(),"Data","UCI HAR Dataset")  #  ! CHANGE BEFORE SUBMIT !

###################################

TEST_SET_RAW <-  read.table(file = file.path(basedir,"test" ,"X_test.txt"), header=FALSE,  )

TRAIN_SET_RAW <- read.table(file = file.path(basedir,"train","X_train.txt"), header=FALSE, )

FEATURES_SET <- read.table(file = file.path(basedir,"features.txt"), header=FALSE, )

features<- as.vector(FEATURES_SET[,"V2"])

colnames(TEST_SET_RAW) <- features 

colnames(TRAIN_SET_RAW) <- features 

###################################

TEST_SET <- TEST_SET_RAW[ grep("mean\\(|std\\(", names(TEST_SET_RAW))  ] 
  
TRAIN_SET <- TRAIN_SET_RAW[ grep("mean\\(|std\\(", names(TRAIN_SET_RAW))  ] 

DATA <- rbind(TEST_SET, TRAIN_SET)

###################################

rm(TEST_SET_RAW)

rm(TRAIN_SET_RAW)

rm(TEST_SET)

rm(TRAIN_SET)

###################################

ACT_TEST_SET <-  read.table(file = file.path(basedir,"test" ,"y_test.txt"), header=FALSE,  )

ACT_TRAIN_SET <-  read.table(file = file.path(basedir,"train" ,"y_train.txt"), header=FALSE,  )

ACT_SET <- rbind(ACT_TEST_SET, ACT_TRAIN_SET)

ACT_INFO <-  read.table(file = file.path(basedir,"activity_labels.txt"), header=FALSE,  )

ACT_SET[["V1"]] <- ACT_INFO[ match(ACT_SET[['V1']], ACT_INFO[['V1']] ) , 'V2']

colnames(ACT_SET)[1] <- "activityName"

DATA <- cbind(ACT_SET,DATA)

###################################

SUBJ_TEST_SET <-  read.table(file = file.path(basedir,"test" ,"subject_test.txt"), header=FALSE,  )

SUBJ_TRAIN_SET <-  read.table(file = file.path(basedir,"train" ,"subject_train.txt"), header=FALSE,  )

SUBJ_SET <- rbind(SUBJ_TEST_SET, SUBJ_TRAIN_SET)

colnames(SUBJ_SET)[1] <- "subjectID"

DATA <- cbind(SUBJ_SET,DATA)

###################################
###################################

dif_labels = c("subjectID", "activityName")

data_labels = setdiff(colnames(DATA), dif_labels)

MELT = melt(DATA, id = dif_labels, measure.vars = data_labels)

TIDY_DATA = dcast(MELT, subjectID + activityName ~ variable, mean)

###################################

write.table(TIDY_DATA, file = "tidy_data.txt",  row.names=FALSE)

###################################























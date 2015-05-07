
R1 <- read.csv(file = "./Data/Getting and Cleaning Data/getdata_data_ss06hid.csv",
               head=TRUE,sep=",")

R1VAL = R1[,"VAL"]
valid = !is.na(R1VAL)
R1VAL = R1VAL[valid]

subSet = R1VAL[R1VAL>23]
length(subSet) # 53

#######################################

library(XML)

D = xmlTreeParse(file = "./Data/Getting and Cleaning Data/getdata_data_restaurants.xml",)

















library(xlsx)

R = read.xlsx(file = "./Data/Getting and Cleaning Data/getdata_data_DATA.gov_NGAP.xlsx",
          head=TRUE,sheetIndex=1)

dat = R[18:23,7:15]


rows <- 18:23
cols <- 7:15
dat2 <- read.xlsx(file = "./Data/Getting and Cleaning Data/getdata_data_DATA.gov_NGAP.xlsx",
                  1, colIndex = cols, rowIndex = rows)

sum(dat2$Zip*dat2$Ext,na.rm=T) 










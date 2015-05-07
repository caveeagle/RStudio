
library(data.table)

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"

f <- file.path(getwd(), "ss06pid.csv")

download.file(url, f)

DT <- fread(f)


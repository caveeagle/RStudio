
# ################################### #

Соединение строк

"%+%" <- function(...){
  paste0(...)
}

# ################################### #


myData <- read.csv(file = "./Data/StudyExample.csv",head=TRUE,sep=",")

View(myData)

goodData <- complete.cases(myData)

countGoodData <- factor(goodData)

table(countGoodData)

# ################################### #

# Q11

d <- read.csv(file = "./Data/StudyExample.csv",head=TRUE,sep=",")

colnames(d)

# Q12

q12 = d[1:2,] # dataframe[row.index, column.index] 
View(q12)

# Q13
nrow(d)

# Q14
q14 = d[152:153,]
View(q14)

# Q15
q15 = d[47,"Ozone"]

# Q16

Ozone = d[,"Ozone"]

isValid = !is.na(Ozone)

validFactor <- factor(isValid)

table(validFactor)

################

# Q17

Ozone = d[,"Ozone"] 

valid = !is.na(Ozone)

V = Ozone[valid]

View(V)

meanV = round( mean(V), digits = 1)

################

# Q18

d <- read.csv(file = "./Data/StudyExample.csv",head=TRUE,sep=",")

subSet = d[d$Ozone>31 & d$Temp>90, ]

colMeans = mean(subSet$Solar.R,na.rm = TRUE)

################

# Q19

subSetMonth = d[d$Month==6, ]

mT = mean(subSetMonth$Temp,na.rm = TRUE)

# Q20

sM = d[d$Month==5,]

max(sM$Ozone,na.rm = TRUE)

################

tapply(flags$animate, flags$landmass, mean)

################




  
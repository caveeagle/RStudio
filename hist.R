file = sprintf("%s/%03i.csv", directory, i )
rawData <- read.csv(file =file,head=TRUE,sep=",")
goodData <- complete.cases(rawData)
countGoodData <- sum(goodData)
nobs = c(nobs,countGoodData)
}
retData = cbind(id,nobs)
View(retData)
complete <- function(directory, id = 1:332)
{
nobs = c()
for(i in id)
{
file = sprintf("%s/%03i.csv", directory, i )
rawData <- read.csv(file =file,head=TRUE,sep=",")
goodData <- complete.cases(rawData)
countGoodData <- sum(goodData)
nobs = c(nobs,countGoodData)
}
retData = cbind(id,nobs)
retData
}
complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 3)
source("submitscript1.R")
submit()
2
submit()
submit()
submit()
submit()
complete <- function(directory, id = 1:332)
{
nobs = c()
for(i in id)
{
file = sprintf("%s/%03i.csv", directory, i )
rawData <- read.csv(file =file,head=TRUE,sep=",")
goodData <- complete.cases(rawData)
countGoodData <- sum(goodData)
nobs = c(nobs,countGoodData)
}
#retData = cbind(id,nobs)
retData = data.frame(id = id, nobs = nobs)
retData
}
complete("specdata", c(2, 4, 8, 10, 12))
submit()
submit()
submit()
directory <- listfiles("directory")
list.files("specdata")
list <= list.files("specdata")
list = list.files(directory)
directory <- "specdata"
threshold <- 400
list = list.files(directory)
for(file in list)
{
file
}
directory <- "specdata"
threshold <- 400
list = list.files(directory)
for(f in list)
{
f
}
?cor
directory <- "specdata"
threshold <- 400
list = list.files(directory)
for(fname in list)
{
file = sprintf("%s/%03i.csv", directory, fname )
rawData <- read.csv(file =file,head=TRUE,sep=",")
goodData <- complete.cases(rawData)
countGoodData <- sum(goodData)
if(countGoodData<=threshold) { next }
C1 <- goodData[["nitrate"]]
C2 <- goodData[["sulfate"]]
Res <- cor(C1,C2)
}
"%+%" <- function(...){  paste0(...) }
directory <- "specdata"
threshold <- 400
list = list.files(directory)
for(fname in list)
{
file = directory %+% '/' %+% fname
rawData <- read.csv(file =file,head=TRUE,sep=",")
goodData <- complete.cases(rawData)
countGoodData <- sum(goodData)
if(countGoodData<=threshold) { next }
C1 <- goodData[["nitrate"]]
C2 <- goodData[["sulfate"]]
Res <- cor(C1,C2)
}
"%+%" <- function(...){  paste0(...) }
directory <- "specdata"
threshold <- 400
list = list.files(directory)
fname = "001.csv";
file = directory %+% '/' %+% fname
rawData <- read.csv(file =file,head=TRUE,sep=",")
goodData <- rawData[complete.cases(rawData), ]
countGoodData <- sum(goodData)
View(goodData)
length(goodData)
nrow(goodData)
"%+%" <- function(...){  paste0(...) }
directory <- "specdata"
threshold <- 10
list = list.files(directory)
#for(fname in list)
{
fname = "001.csv";
file = directory %+% '/' %+% fname
rawData <- read.csv(file =file,head=TRUE,sep=",")
goodData <- rawData[complete.cases(rawData), ]
countGoodData <- nrow(goodData)
if(countGoodData<=threshold) { next }
C1 <- goodData[["nitrate"]]
C2 <- goodData[["sulfate"]]
Res <- cor(C1,C2)
}
?cor
"%+%" <- function(...){  paste0(...) }
directory <- "specdata"
threshold <- 400
list = list.files(directory)
Res = c()
for(fname in list)
{
fname = "001.csv";
file = directory %+% '/' %+% fname
rawData <- read.csv(file =file,head=TRUE,sep=",")
goodData <- rawData[complete.cases(rawData), ]
countGoodData <- nrow(goodData)
if(countGoodData<=threshold) { next }
Res <- c(Res, cor(goodData$nitrate, goodData$sulfate)
}
Res
"%+%" <- function(...){  paste0(...) }
directory <- "specdata"
threshold <- 400
list = list.files(directory)
Res = c()
for(fname in list)
{
fname = "001.csv";
file = directory %+% '/' %+% fname
rawData <- read.csv(file =file,head=TRUE,sep=",")
goodData <- rawData[complete.cases(rawData), ]
countGoodData <- nrow(goodData)
if(countGoodData<=threshold) { next }
Res <- c(Res, cor(goodData$nitrate, goodData$sulfate) )
}
Res
Res = c()
for(fname in list)
{
fname = "001.csv";
file = directory %+% '/' %+% fname
rawData <- read.csv(file =file,head=TRUE,sep=",")
goodData <- rawData[complete.cases(rawData), ]
countGoodData <- nrow(goodData)
if(countGoodData>threshold)
{
Res <- c(Res, cor(goodData$nitrate, goodData$sulfate) )
}
}
Res <- c()
for(fname in list)
{
#fname = "001.csv";
file = directory %+% '/' %+% fname
rawData <- read.csv(file =file,head=TRUE,sep=",")
goodData <- rawData[complete.cases(rawData), ]
countGoodData <- nrow(goodData)
if(countGoodData>threshold)
{
Res <- c(Res, cor(goodData$nitrate, goodData$sulfate) )
}
}
"%+%" <- function(...){  paste0(...) }
corr <- function(directory, threshold = 0)
{
list = list.files(directory)
Res <- c()
for(fname in list)
{
file = directory %+% '/' %+% fname
rawData <- read.csv(file =file,head=TRUE,sep=",")
goodData <- rawData[complete.cases(rawData), ]
countGoodData <- nrow(goodData)
if(countGoodData>threshold)
{
Res <- c(Res, cor(goodData$nitrate, goodData$sulfate) )
}
}
return(Res)
}
cr <- corr("specdata", 400)
head(cr)
summary(cr)
submit()
source("submitscript1.R")
submit()
submit()
submit()
library(swirl)
swirl()
0
info
info()
main()
num_vect <- c(0.5,55,-10,6)
tf <- num_vect[num_vect<1]
tf <- num_vect<1
tf
num_vect >= 6
my_char <- c("My","name","is")
my_char
paste(my_char, collapse = " ")
c(my_char, "Victor")
my_name <- c(my_char, "Victor")
my_name
paste0(my_name)
paste(my_name, collapse = " ")
paste("Hello", "world!", sep = " ")
paste(c("X", "Y", "Z"))
paste(1:3, c("X", "Y", "Z"), sep = "")
paste(LETTERS, 1:4, sep = "-")
main()
my_vector <- 1:20
my_vector
dim(my_vector)
length(my_vector)
dim(my_vector) <- c(4, 5)
dim(my_vector)
attributes(my_vector)
my_vector
class(my_vector)
my_matrix <- my_vector
?matrix
my_matrix2 <- matrix(1:20,nrow=4,ncol=5)
identical(my_matrix,my_matrix2)
b
patients <- c("Bill", "Gina", "Kelly", "Sean")
cbind(patients,my_matrix)
my_data <- data.frame(patients, my_matrix)
my_data
class(my_data)
cnames<-c("patient", "age", "weight", "bp", "rating", "test")
info()
play()
?colnames
nxt()
colnames(cnames) <- my_data
colnames(cnames,my_data)
colnames(cnames)
colnames(my_data) <- cnames
my_data
1/0
log(-1)
print "TEST"
print("TEST")
?traceback
foo <- function(x) { print(1); bar(2) }
bar <- function(x) { x + a.variable.which.does.not.exist }
foo(2)
traceback()
options(error = function() traceback(2))
foo(2)
?debug
geterr <- function()
{
for(i in 2:-2)
{
m = log(i)
print(m);
}
}
geterr()
debug(seterr)
debug(geterr)
geterr()
browser(text="ERROR DETECTED!",condition=(m<0))
geterr <- function()
{
for(i in 2:-2)
{
m = log(i)
print(m);
}
}
geterr <- function()
{
browser(text="ERROR DETECTED!",condition=(m<0))
for(i in 2:-2)
{
m = log(i)
print(m);
}
}
geterr()
geterr()
geterr <- function()
{
for(i in 2:-2)
{
m = log(i)
browser(text="ERROR DETECTED!",condition=(m<0))
print(m);
}
}
geterr()
geterr()
undebug(geterr)
geterr()
geterr()
geterr <- function()
{
for(i in 2:-2)
{
m = log(i)
browser(text="ERROR DETECTED!",condition=(m<0))
print(m);
}
}
geterr()
geterr2 <- function()
{
for(i in 2:-2)
{
m = log(i)
browser(text="ERROR DETECTED!",condition=(m<0))
print(m);
}
}
geterr2()
library(swirl)
swirl()
bye()\
bye()
swirl()
head(flags)
play()
View(flags)
nxt()
dim(flags)
class(flags)
cls_list <- lapply(flags, class)
cls_list
class(cls_list)
as.character(cls_list)
cls_vect <- sapply(flags, class)
class(cls_vect)
sum(flags$orange)
flag_colors <- flags[, 11:17]
head(flag_colors)
sum(flags$orange)
lapply(flag_colors, sum)
sapply(flag_colors, sum)
sapply(flag_colors, mean)
flag_shapes <- flags[, 19:23]
lapply(flag_shapes,range)
sapply(flag_shapes,range)
shape_mat <- sapply(flag_shapes, range)
shape_mat
class(shape_mat)
unique(c(3, 4, 5, 5, 5, 6, 6))
unique_vals <- lapply(flags,unique)
unique_vals
sapply(unique_vals,length)
sapply(flags,unique)
lapply(unique_vals, function(elem) elem[2])
info()
main()
sapply(flags, unique)
library(datasets)
data(iris)
?iris
dataSet<-data(iris)
View(iris)
swirl()
library(swirl)
swirl
swirl()
main()
sapply(flags, unique)
paly()
play()
?vapply
nxt()
vapply(flags, unique, numeric(1))
ok()
vapply(flags, class, numeric(1))
ok()
sapply(flags, class)
vapply(flags, class, character(1)
)
?tapply
table(flags$landmass)
table(flags$animate)
tapply(flags$animate, flags$landmass, mean)
tapply(flags$population, flags$red, summary)
tapply(flags$population, flags$landmass, summary)
data(cars)
?cars
play()
View(cars)
nxt()
head(cars)
plot(cars)
?plot
plot(x = cars$speed, y = cars$dist)
plot(y = cars$speed, x = cars$dist)
plot(y = cars$speed, x = cars$dist, xlab = "Speed",ylab="Distance")
plot(y = cars$speed, x = cars$dist, xlab = "Speed")
plot(x = cars$speed, y = cars$dist, xlab = "Speed")
plot(x = cars$speed, y = cars$dist, xlab = "Speed" y="Stopping Distance")
plot(x = cars$speed, y = cars$dist, xlab = "Speed" ylab ="Stopping Distance")
plot(x = cars$speed, y = cars$dist, xlab = "Speed", ylab ="Stopping Distance")
plot(x = cars$speed, y = cars$dist, ylab = "Stopping  Distance")
plot(x = cars$speed, y = cars$dist, ylab = "Stopping  Distance")
plot(x = cars$speed, y = cars$dist, ylab = "Stopping  Distance")
plot(x = cars$speed, y = cars$dist, ylab = "Stopping Distance")
plot(x = cars$speed, y = cars$dist, xlab = "Speed", ylab ="Stopping Distance")
plot(x = cars$speed, y = cars$dist, xlab = "Speed", ylab ="Stopping Distance", main="My Plot")
plot(cars, main = "My Plot")
plot(cars, main = "My Plo")
plot(cars, sub = "My Plot Subtitle")
ss
plot(cars, sub = "My Plot Subtitles")
plot(cars, col = 2)
plot(cars, xlim = c(10, 15))
?points
plot(cars, pch=8)
plot(cars, pch=2)
data(mtcar)
data(mtcars)
View(mtcars)
?boxplot
boxplot(mtcars,formula =  mpg ~ cyl )
boxplot(formula = mpg ~ cyl, data = mtcars)
hist(mtcars$mpg)
library(datasets)
data(iris)
View(iris)
Q1 <- mean(iris$Sepal.Length)
mean(iris$Sepal.Length)
Q1 <- tapply(iris$Sepal.Length, iris$Species, mean)
Q1 <- tapply(iris$Sepal.Length, iris$Species, mean)
View(Q1)
Q1 <- tapply(iris$Sepal.Length, iris$Species, sum)
View(Q1)
Q1 <- sapply(iris$Species, sum)
View(Q1)
Q1 <- sapply(iris$Species, length)
View(Q1)
class(iris)
cls_list <- lapply(iris, class)
View(cls_list)
Q1 <- tapply(iris$Sepal.Length, iris$Species, mean)
View(Q1)
apply(iris[, 1:4], 2, mean)
rowMeans(iris[, 1:4])
library(datasets)
data(mtcars)
View(mtcars)
with(mtcars, tapply(mpg, cyl, mean))
tapply(mtcars$cyl, mtcars$mpg, mean)
Q3 <- tapply(mtcars$cyl, mtcars$mpg, mean)
View(Q3)
mean(mtcars$mpg, mtcars$cyl)
split(mtcars, mtcars$cyl)
? with
with(mtcars, tapply(mpg, cyl, mean))
Qt <- tapply(mpg, cyl, mean)
tapply(mtcars$cyl, mtcars$mpg, mean)
Q3 <- with(mtcars, tapply(mpg, cyl, mean))
View(Q3)
Qt <- tapply(mtcars$mpg ,mtcars$cyl, mean)
View(Qt)
?equal
?ident
??ident
??identical
identical(Q3,Qt)
?mtcars
Q4 <- tapply(mtcars$hp ,mtcars$cyl, mean)
View(Q4)
209.21429-82.63636
ls
ls()
debug(ls)
ls()
exit()
exit
stop
stop()
undebug(ls)
ls()
swirl()
library(swirl)
swirl()
head(flags)
dim(flags)
savehistory("D:/!RStudio/sapply_swirl.R")

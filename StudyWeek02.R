library(datasets)
data(iris)
library(datasets)
data(mtcars)

# Q1

Q1 <- tapply(iris$Sepal.Length, iris$Species, mean)
View(Q1)

# Q2

apply(iris[, 1:4], 2, mean)

# Q3

Q3 <- with(mtcars, tapply(mpg, cyl, mean))
View(Q3)
Qt <- tapply(mtcars$mpg ,mtcars$cyl, mean)
identical(Q3,Qt)

# Q4

Q4 <- tapply(mtcars$hp ,mtcars$cyl, mean)

View(Q4)
209.21429-82.63636








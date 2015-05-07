rm(list=ls()) # Clear enviroment
R <- read.csv("Data/normalStatTest.csv")
M <- as.matrix(R)
Varianta <- mapply( function (x,y) (y+x)/2 , M[,1],M[,2] )


M <- cbind(M,Varianta)
View(M)

# Мат.ожидание
Mean <- weighted.mean(M[,"Varianta"],M[,"Number"])

# Частоты распределения
SUM <- sum(M[,"Number"])
F <- mapply( function (x) x/SUM , M[,"Number"] )

# Проверка на нормальность (графически)
qqnorm(F)

# Дисперсия
T1 <- mapply( function (x,y) (x^2)*y , M[,"Varianta"],M[,"Number"] )
Sq1 = sum(T1)/sum(M[,"Number"])
D <- Sq1-Mean^2
Sigma <- sqrt(D)

# Ожидаемые значения

eNum <- mapply(
             function(xmin,xmax){
               diff <- pnorm(xmax,mean=Mean, sd=Sigma)-pnorm(xmin,mean=Mean, sd=Sigma)
               diff*SUM
             },M[,"AgeMin"],M[,"AgeMax"])

# Графики сравнения

#plot(M[,"Varianta"],M[,"Number"],,type="b",col="blue4")
#par(new=TRUE)
#plot(M[,"Varianta"],eNum,type="b",col="red")

plot(M[,"Varianta"],eNum,type="b",col="red")
lines(M[,"Varianta"],M[,"Number"],type="b",col="blue4")

mtext("- Ожид.значение", side=3, line=1, col="red")
mtext("- Набл.значение", side=3, line=2, col="blue4")

# Критерий Кси^2

M <- cbind(M,eNum)

vKsi <- mapply(
  function(fo,fe){
  (fo-fe)^2/fe  
  },M[,"Number"],M[,"eNum"])

ksi2 = sum(vKsi)
#qchisq(p = 0.71, df = 5)

















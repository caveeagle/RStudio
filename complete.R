
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

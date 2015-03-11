
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

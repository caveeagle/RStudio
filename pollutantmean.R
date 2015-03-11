
pollutantmean <- function(directory='specdata', pollutant, id = 1:332) 
{
  allData = c()
  
  for(i in id) 
  {
  
    file = sprintf("%s/%03i.csv", directory, i )
  
    rawData <- read.csv(file =file,head=TRUE,sep=",")
  
    rawData <- rawData[[pollutant]]
  
    allData = c(allData,rawData);
  }
  
  meanV = mean(allData,na.rm = TRUE)
  
  meanV = round( meanV, digits = 3)
  
  meanV
}

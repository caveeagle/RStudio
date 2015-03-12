
head(rankall("heart attack", 20), 10)

rankall <- function(outcome, num = "best") 
{
   RAWDATA <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
   stateList = unique(RAWDATA$State) 

    values <- c()

    for (state in stateList) 
    {
      R = rankhospital(state, outcome, num)
      values <- c(values,R)
    }

    RET <- data.frame(values, stateList)
    colnames(RET) <- c("hospital", "state")
    return(RET)
    
}

rankhospital <- function(state, outcome, num = "best") 
{
    RESULT <- getOrderedSubset(state, outcome)
    
    if(num == "best") 
    {
        RETVALUE = RESULT[1,"name"]
    }
    if(num == "worst") 
    {
        RESULT <- RESULT[!is.na(RESULT[,"outcome"]),]
      
        RETVALUE = RESULT[nrow(RESULT),"name"]
    }
    if(  (num != "worst") && (num != "best") ) 
    {
        if(num>nrow(RESULT))
        {
         RETVALUE = NA
        }
        else
        {
          RETVALUE = RESULT[num,"name"]
        }
    }

    return(RETVALUE)
}

getOrderedSubset <- function(state, outcome) 
{
  
  #state = "TX" # for tests
  #outcome = "heart attack"
  
  ## Read outcome data
  
  RAWDATA <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Make state list and check the state
  
  stateList = unique(RAWDATA$State) 
  
  if (!is.element(state, stateList)) 
    stop("invalid state")
  
  ## Make outcome list and aliases, and check outcome
  
  S1 = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
  S2 = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
  S3 = "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
  
  outcomeList <- list("heart attack"=S1,
                      "heart failure"=S2,
                      "pneumonia"=S3) 
  
  outSTR = outcomeList[[outcome]] # Long string with column name
  
  if(is.null(outSTR))
  {
    stop("invalid outcome")
  }
  
  ## Make subset with only necessary data
  
  # select only one state
  R1 <- RAWDATA[RAWDATA$State==state,]
  
  v1<-R1[["Hospital.Name"]]
  v2<-R1[[outSTR]]
  
  v2 <- as.numeric(v2)
  
  SubSet <- cbind(v1,v2)
  colnames(SubSet)<-c("name","outcome")
  
  ## Ordering subset
  
  SubSet <- SubSet[order(as.numeric(SubSet[,"outcome"]),SubSet[,"name"]),]
  
  ## And return
  
  return(SubSet)
}


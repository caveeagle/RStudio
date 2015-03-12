
#head(rankall("heart attack", 20), 10)


rankall <- function(outcome, num = "best") 
{
  #outcome = "heart attack"
  #num = 20
  #state = "GU"
    
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
  
  ## Read outcome data
  
  RAWDATA <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  
  
  ## Make state list and check the state
  
  stateList = unique(RAWDATA$State) 
  
  VALUES <- c()
  
  for (state in stateList) 
  {
        #print(state)
        ## Make subset with only necessary data
        R1 <- RAWDATA[RAWDATA$State==state,]
        v1<-R1[["Hospital.Name"]]
        v2<-R1[[outSTR]]
        v2 <- as.numeric(v2)
        RESULT <- cbind(v1,v2)
        colnames(RESULT)<-c("name","outcome")
        
        ## Ordering subset
        if(nrow(RESULT)>1)
        RESULT <- RESULT[order(as.numeric(RESULT[,"outcome"]),RESULT[,"name"]),]
        
        ## GET RESULT FROM SUBSET
        if(num == "best") 
        {
            RETVALUE = RESULT[1,"name"]
        }
        if(num == "worst") 
        {
           if(nrow(RESULT)>1)  
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
        VALUES <- c(VALUES,RETVALUE)
  }


    RET <- data.frame(VALUES, stateList)
    colnames(RET) <- c("hospital", "state")
    return(RET)
  
    return(RET)
}


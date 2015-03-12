## Check ##

#best("TX", "heart attack")
# [1] "CYPRESS FAIRBANKS MEDICAL CENTER"

#best("TX", "heart failure")
# [1] "FORT DUNCAN MEDICAL CENTER"

#best("MD", "heart attack")
# [1] "JOHNS HOPKINS HOSPITAL, THE"

#best("MD", "pneumonia")
# [1] "GREATER BALTIMORE MEDICAL CENTER"

#best("BB", "heart attack")
# Error in best("BB", "heart attack") : invalid state

#best("NY", "hert attack")
# Error in best("NY", "hert attack") : invalid outcome

best <- function(state, outcome) 
{
    RESULT <- getOrderedSubset(state, outcome)

    bestName <- RESULT[1,"name"]

    return(bestName)
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


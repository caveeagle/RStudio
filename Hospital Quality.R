
############################
############################

R <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
View(R)

NM <- names(R)
View(NM)

R[, 11] <- as.numeric(R[, 11])
hist(R[, 11],breaks=80)

############################
############################

# Assignment 1

state = "TX"

outcome = "heart failure"

R1 <- R[R$State==state,]

S1 = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
S2 = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
S3 = "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"

############################

stateList = unique(R$State) 
View(stateList)

if (!is.element(state, stateList)) 
  stop("invalid state")

############################

outL <- list("heart attack"=S1,
          "heart failure"=S2,
          "pneumonia"=S3) 

STR = outL[[outcome]]

if(is.null(STR))
{
  stop("invalid outcome")
}

############################

v1<-R1[["Hospital.Name"]]
v3<-R1[[STR]]
v3 <- as.numeric(v3)
S <- cbind(v1,v3)
colnames(S)<-c("name","outcome")
View(S)
object.size(S)

Ord <- S[order(as.numeric(S[,"outcome"]),S[,"name"]),]
View(Ord)

bestName <- Ord[1,"name"]
bestName

############################
############################













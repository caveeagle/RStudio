
DS <- read.csv("./Data/ss06hid.csv")

agricultureLogical <- DS$ACR == 3 & DS$AGS == 6

which(agricultureLogical)[1:3]

########################################

library(dplyr)

EDS <- read.csv("./Data/EDSTATS_Country.csv")

GDP <- read.csv("./Data/GDP.csv")

#########################

  GDP_CLEAR <-  GDP[5:200,] %>%
  
  select(X,X.3) %>%
  
  rename( CountryCode = X, val_str = X.3) %>%
  
  mutate( val = as.numeric( gsub(",","",val_str) ) ) %>%
  
  filter( CountryCode!="",!is.na(val) ) %>%
  
  arrange( val )


#########################

DATA <- merge(GDP_CLEAR, EDS, all = TRUE, by = c("CountryCode"))

DATA <- arrange(DATA,val)

DATA[13,]

nrow(DATA)





















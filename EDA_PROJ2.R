
# Exploratory Data Analysis, Course Project 2

#####################################################
#####################################################

# Download and unzip file 

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"

zipdir <- file.path(getwd(),"Data")

dir.create(zipdir)

zipfile <- file.path(zipdir,"NEI_data.zip")

download.file(url, zipfile)

unzip(zipfile,exdir=zipdir)

#####################################################
#####################################################

# Read files

basedir <- file.path(getwd(),"Data","Exploratory Data Analysis")  #  ! CHANGE BEFORE SUBMIT !

NEI <- readRDS( file = file.path(basedir,"summarySCC_PM25.rds") )

SCC <- readRDS( file = file.path(basedir,"Source_Classification_Code.rds"))

#####################################################
#####################################################
#
#  QUESTION 1 
#  
#  Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#  Using the base plotting system, make a plot showing the total PM2.5 emission 
#  from all sources for each of the years 1999, 2002, 2005, and 2008.
#


totalEmissionByYear <- tapply(NEI$Emissions, NEI$year, sum)

barplot(totalEmissionByYear, col = "coral4", ylab = "PM2.5 emissions (in tons)", 
     xlab = "Year", main = "Total PM2.5 emission by years")


dev.copy(png, file="plot1.png", height=480, width=480)

dev.off()

### Conclusion: total emissions from PM2.5 decreased in the United States from 1999 to 2008

#####################################################
#####################################################
#
#  QUESTION 2
#
#  Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
#  from 1999 to 2008? 

BaltimorSet <- NEI[NEI$fips == "24510", ]

baltEmissionByYear <- with(BaltimorSet,  aggregate(Emissions, by = list(year), sum) )

colnames(baltEmissionByYear) <- c("Year", "Emissions")

plot(baltEmissionByYear, type = "b", pch = 16,
        col = "darkred", ylab = "PM2.5 emissions (in tons)", 
        xlab = "Year", main = "Baltimore PM2.5 emission by years")

dev.copy(png, file="plot2.png", height=480, width=680)

dev.off()

# Conclusion: on average, total emissions from PM2.5 decreased in the Baltimore City from 1999 to 2008

#####################################################
#####################################################
#
# Question 3
#
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad)
# variable, which of these four sources have seen decreases in emissions 
# from 1999–2008 for Baltimore City? 
#
# Which have seen increases in emissions from 1999–2008? 
#

library(ggplot2)

library(plyr)

baltEmissionByTypes <- ddply(BaltimorSet, .(type, year), summarize, Emissions = sum(Emissions))

colnames(baltEmissionByTypes)[1] <- "pollutionType"

qplot(year, Emissions, data = baltEmissionByTypes, group = pollutionType, 
      color = pollutionType, geom = c("point", "line"), 
      ylab = "PM2.5 emissions (in tons)", 
      xlab = "Year", main = "Total Emissions in U.S. by Type of Pollutant")

dev.copy(png, file="plot3.png", height=480, width=680)

dev.off()

# Conclusion:
# From 1999–2008 for Baltimore City 
# nonpoint, onroad, nonroad type of sources have seen decreases in emissions. 
# Point type has seen increased emissions until year 2005 and then decreased. 

#####################################################
#####################################################
#
# Question 4
#
# Across the United States, how have emissions 
# from coal combustion-related sources changed from 1999–2008?
#


coalSources <- SCC[SCCSet$EI.Sector == "Fuel Comb - Comm/Institutional - Coal",]["SCC"]

coalEmission <- NEI[NEI$SCC %in% coalSources$SCC, ]

coalEmissionByYear <- tapply(coalEmission$Emissions, coalEmission$year, sum)

barplot(coalEmissionByYear, col = "burlywood4", ylab = "Coal related PM2.5 emissions (in tons)", 
        xlab = "Year", main = "Coal related emissions by years")

dev.copy(png, file="plot4.png", height=480, width=480)

dev.off()

# Conclusion:
#
# Emissions from coal combustion-related sources decreased from 1999 to 2008,
# and extremly decreased from 2005 year.


#####################################################
#####################################################
#
# QUESTION 5
#
# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City? 
#

onroadSet <- NEI[ NEI$fips == "24510" & NEI$type == 'ON-ROAD', ]

onroadEmission <- aggregate(onroadSet[, 'Emissions'], by = list(onroadSet$year), sum)

colnames(onroadEmission) <- c('year', 'Emissions')

ggplot( data = onroadEmission, aes(x = year, y = Emissions)) + 
  geom_bar( aes(fill = year), stat = "identity" , fill="bisque3", colour="bisque4") +
  ggtitle('Emissions from motor vehicle sources in Baltimore') +
  ylab("PM2.5 emissions (in tons)") + xlab('Year') +
  theme_bw() +
  theme(legend.position = 'none') + 
  scale_x_continuous(breaks=onroadEmission$year )

dev.copy(png, file="plot5.png", height=480, width=480)

dev.off()

# Conclusion:
# Emissions from motor vehicle sources decreased from 1999-2008 in Baltimore City

#####################################################
#####################################################
#
# QUESTION 6
#
# Compare emissions from motor vehicle sources in Baltimore City 
# with emissions from motor vehicle sources in Los Angeles County, California
# Which city has seen greater changes over time in motor vehicle emissions?
#

onroadBaltimorSet <- NEI[ NEI$fips == "24510" & NEI$type == 'ON-ROAD', ]
onroadBaltimorEmission <- aggregate(onroadBaltimorSet[, 'Emissions'], by = list(onroadBaltimorSet$year), sum)
colnames(onroadBaltimorEmission) <- c('year', 'Emissions')

onroadBaltimorEmission$City <- paste(rep('Baltimor', 4))

onroadCaliforniaSet <- NEI[ NEI$fips == "06037" & NEI$type == 'ON-ROAD', ]
onroadCaliforniaEmission <- aggregate(onroadCaliforniaSet[, 'Emissions'], by = list(onroadCaliforniaSet$year), sum)
colnames(onroadCaliforniaEmission) <- c('year', 'Emissions')

onroadCaliforniaEmission$City <- paste(rep('California', 4))

SET <- rbind(onroadBaltimorEmission,onroadCaliforniaEmission)

#####################################################

ggplot(data = SET, aes(x = year, y = Emissions)) +
  geom_bar(aes(fill = year),stat = "identity") +
  ggtitle('Emissions from motor vehicle sources in Baltimore and Los Angeles') +
  ylab("PM2.5 emissions (in tons)") + xlab('Year') +
  theme_bw() +
  theme(legend.position = 'none') + 
  scale_x_continuous(breaks=onroadEmission$year ) +
  facet_grid(. ~ City ) +
  geom_text(aes(label = round(Emissions, 0), vjust = -0.5))


dev.copy(png, file="plot6.png", height=480, width=680)

dev.off()

# Conclusion:
# California have seen greater changes over time in motor vehicle emissions

#####################################################
#####################################################













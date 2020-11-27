
##Exploratory Data Analysis
##Week 1 Assignment
##Plot 1
##By Mike Dunlap

##Load Libraries
library(dplyr)

##Download Data
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(fileURL, temp, method="curl")
unzip(temp)

##upload data to session
powerConsumption <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE
                             , stringsAsFactors = FALSE)

##subset data to be plotted

plotData <- filter(powerConsumption, (Date == "2/2/2007" | Date == "1/2/2007"))

##convert to numeric
plotData$Global_active_power <- as.numeric(plotData$Global_active_power)

##do the histogram
hist(plotData$Global_active_power, col = "Red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

##export to PNG and close graphics device
dev.copy(png, file = "Plot1.png")
dev.off()



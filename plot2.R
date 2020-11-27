
##Exploratory Data Analysis
##Week 1 Assignment
##Plot 2
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

##convert date & time
plotData <- mutate(plotData, datetime = paste(Date, Time))

plotData$datetime <- strptime(plotData$datetime, format = "%d/%m/%Y %H:%M:%S")

##do the graph
with(plotData, plot(datetime, Global_active_power, type = "l", xlab = "",
                    ylab = "Global Active Power (kilowatts)"))


##export to PNG and close graphics device
dev.copy(png, file = "Plot2.png")
dev.off()



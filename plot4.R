
##Exploratory Data Analysis
##Week 1 Assignment
##Plot 4
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
plotData$Sub_metering_1 <- as.numeric((plotData$Sub_metering_1))
plotData$Sub_metering_2 <- as.numeric((plotData$Sub_metering_2))
plotData$Voltage <- as.numeric((plotData$Voltage))
plotData$Global_reactive_power <- as.numeric((plotData$Global_reactive_power))



##convert date & time
plotData <- mutate(plotData, datetime = paste(Date, Time))

plotData$datetime <- strptime(plotData$datetime, format = "%d/%m/%Y %H:%M:%S")

##Make four quadrant graph
par(mfrow = c(2,2))


##do the graph - Q1
with(plotData, plot(datetime, Global_active_power, type = "l", xlab = "",
                    ylab = "Global Active Power"))

##do the graph - Q2
with(plotData, plot(datetime, Voltage, type = "l", xlab = "datetime",
                    ylab = "Voltage"))

##do the graph - Q3
with(plotData, plot(datetime, Sub_metering_1, type = "l", xlab = "",
                    ylab = "Energy sub metering"))
with(plotData, points(datetime, Sub_metering_2, type = "l", col = "Red"))
with(plotData, points(datetime, Sub_metering_3, type = "l", col = "Blue"))
legend("topright", lty = 1, col = c("Black", "Red", "Blue"), bty = "n",
       legend = c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"))

##do the graph - Q4
with(plotData, plot(datetime, Global_reactive_power, type = "l", xlab = "datetime",
                    ylab = "Global_reactive_power"))


##export to PNG and close graphics device
dev.copy(png, file = "Plot4.png")
dev.off()



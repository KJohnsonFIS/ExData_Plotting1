
setwd ("C:/Users/user/My Documents/Coursera")


## read text file - Electronic Power Consumption
ElecData <- read.table("household_power_consumption.txt", header=T,sep=";",na.strings = c("?"), colClasses=c("Time"="character", "Date"="character"))

## create DateTime field
ElecData$DateTime <- paste(ElecData$Date,ElecData$Time)

ElecData$Date <- as.Date(ElecData$Date, "%d/%m/%Y")  ## Date converted to YYYY-MM-DD format

## subset 2/1/2007 thru 2/2/2007 records
ElecSub <- subset(ElecData, (Date == "2007-02-01" | Date == "2007-02-02"))

## convert DateTime to date format
ElecSub$DateTime <- strptime(ElecSub$DateTime,"%d/%m/%Y %H:%M:%S")

ElecSub$Time <- strptime(ElecSub$Time, "%H:%M")  ## Time converted to R time format


## Open PNG device and create plot3.png in working directory
png(file = "plot3.png", width = 480, height = 480)

#Draw Plot3 - Energy sub meeting - Weekday plot, add lines Sub_metering_1 Sub_metering_2 Sub_metering_3 for  and send to png

with(ElecSub, plot(DateTime, Sub_metering_1, main = "", xlab = "", ylab = "Energy sub metering", pch = ""))

lines(ElecSub$DateTime, ElecSub$Sub_metering_1, col = "black")
lines(ElecSub$DateTime, ElecSub$Sub_metering_2, col = "red")
lines(ElecSub$DateTime, ElecSub$Sub_metering_3, col = "blue")

## create a legend

legend("topright", lwd = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

## close Png device
dev.off()



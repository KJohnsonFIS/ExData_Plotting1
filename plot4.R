
setwd ("C:/Users/user/My Documents/Coursera")


## read text file - Electronic Power Consumption
ElecData <- read.table("household_power_consumption.txt", header=T,sep=";",na.strings = c("?"), colClasses=c("Time"="character", "Date"="character"))

## create datetime field
ElecData$datetime <- paste(ElecData$Date,ElecData$Time)

ElecData$Date <- as.Date(ElecData$Date, "%d/%m/%Y")  ## Date converted to YYYY-MM-DD format

## subset 2/1/2007 thru 2/2/2007 records
ElecSub <- subset(ElecData, (Date == "2007-02-01" | Date == "2007-02-02"))

## convert datetime to date format
ElecSub$datetime <- strptime(ElecSub$datetime,"%d/%m/%Y %H:%M:%S")

ElecSub$Time <- strptime(ElecSub$Time, "%H:%M")  ## Time converted to R time format


## Open PNG device and create plot4.png in working directory
png(file = "plot4.png", width = 480, height = 480)

#Draw Plot4 - 4 charts Global Active Power, Voltage, Energy sub meeting & Global Reactive Power, each by- Weekday plot, add lines Sub_metering_1 Sub_metering_2 Sub_metering_3 for  and send to png

par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0)) ## set # columns to 2, # rows to 2

with(ElecSub, {
 ## row1 column 1 graph
  plot(datetime, Global_active_power, main = "", xlab = "", ylab = "Global Active Power", pch = "")
 lines(ElecSub$datetime, ElecSub$Global_active_power)
 
 ## row1 column 2 graph
 plot(datetime, Voltage, main = "", xlab = "datetime", ylab = "Voltage", pch = "")
 lines(ElecSub$datetime, ElecSub$Voltage)
 
 ## row2 column 1 graph
 plot(datetime, Sub_metering_1, main = "", xlab = "", ylab = "Energy sub metering", pch = "")
 lines(ElecSub$datetime, ElecSub$Sub_metering_1, col = "black")
 lines(ElecSub$datetime, ElecSub$Sub_metering_2, col = "red")
 lines(ElecSub$datetime, ElecSub$Sub_metering_3, col = "blue")
## create a legend
 legend("topright", lwd = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

## row2 column 2 graph
plot(datetime, Global_reactive_power, main = "", pch = "")
lines(ElecSub$datetime, ElecSub$Global_reactive_power)
})




## close Png device
dev.off()



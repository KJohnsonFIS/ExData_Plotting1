
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


## Open PNG device and create plot2.png in working directory
png(file = "plot2.png", width = 480, height = 480)

#Draw Plot2 - Global_active_power - Weekday plot and send to png

with(ElecSub, plot(DateTime, Global_active_power, main = "", xlab = "", ylab = "Global Active Power (kilowatts)", pch = ""))

lines(ElecSub$DateTime, ElecSub$Global_active_power)
     
## close Png device
dev.off()



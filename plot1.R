
setwd ("C:/Users/user/My Documents/Coursera")


## read text file - Electronic Power Consumption
ElecData <- read.table("household_power_consumption.txt", header=T,sep=";",na.strings = c("?"))
 
ElecData$Date <- as.Date(ElecData$Date, "%d/%m/%Y")  ## Date converted to YYYY-MM-DD format

## subset 2/1/2007 thru 2/2/2007 records
ElecSub <- subset(ElecData, (Date == "2007-02-01" | Date == "2007-02-02"))

ElecSub$Time <- strptime(ElecSub$Time, "%H:%M")  ## Time converted to R time format

## Open PNG device and create plot1.png in working directory
png(file="plot1.png")

#Draw Plot1 - Global_active_power Histogram and send to png
hist(ElecSub$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

## close Png device
dev.off()



##Load Data with '?' replaced with NA

epcDF <- read.table("household_power_consumption.txt", sep=";", na.strings="?",header=TRUE)

## Concatenate Date & Time into a new column

epcDF$DateTime <- strptime(paste(as.character(epcDF$Date), as.character(epcDF$Time), sep = " "),format = "%d/%m/%Y %H:%M:%S")

## Convert Date & Time to date/time class

epcDF$Date <- as.Date(as.character(epcDF$Date), format = "%d/%m/%Y")

##subset the data frame for the time period 2007-02-01 to 2007-02/02

epcDFSS <- subset(epcDF, Date == "2007-02-01" | Date == "2007-02-02") 

## set graphics device to png and set filename

png("plot4.png")

## setup 2x2 plot area for 4 plots
par(mfrow=c(2,2))

## plot linechart - Global Active Power

plot(epcDFSS$DateTime, epcDFSS$Global_active_power,type="l", 
xlab = "", ylab = "Global Active Power", 
col = "black", las = 1)

## plot linechart - Voltage

plot(epcDFSS$DateTime, epcDFSS$Voltage,type="l", 
xlab = "datetime", ylab = "Voltage", 
col = "black", las = 1)

## plot linechart - Sub metering

plot(epcDFSS$DateTime, epcDFSS$Sub_metering_1,type="l", 
xlab = "", ylab = "Energy Sub metering", 
col = "black", las = 1)
lines(epcDFSS$DateTime, epcDFSS$Sub_metering_2, type="l", col = "red")
lines(epcDFSS$DateTime, epcDFSS$Sub_metering_3, type="l", col = "blue")

legend(x="topright",y="topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
	 col =c("black","red","blue"), lwd=2)

## plot linechart - Global Reactive Power

plot(epcDFSS$DateTime, epcDFSS$Global_reactive_power,type="l", 
xlab = "datetime", ylab = "Global_reactive_power", 
col = "black", las = 1)

## close the grahphics device and the plot file

dev.off()


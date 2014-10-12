##Load Data with '?' replaced with NA

epcDF <- read.table("household_power_consumption.txt", sep=";", na.strings="?",header=TRUE)

## Concatenate Date & Time into a new column

epcDF$DateTime <- strptime(paste(as.character(epcDF$Date), as.character(epcDF$Time), sep = " "),format = "%d/%m/%Y %H:%M:%S")

## Convert Date & Time to date/time class

epcDF$Date <- as.Date(as.character(epcDF$Date), format = "%d/%m/%Y")

##subset the data frame for the time period 2007-02-01 to 2007-02/02

epcDFSS <- subset(epcDF, Date == "2007-02-01" | Date == "2007-02-02")

## set graphics device to png and set filename

png("plot1.png")

## plot histogram


hist(epcDFSS$Global_active_power, freq = TRUE,     
          include.lowest = TRUE, right = TRUE, 
          main = paste("GLobal Active Power"), col ="red",
	    xlab = "GLobal Active Power (kilowatts)")

## close the grahphics device and the plot file

dev.off()

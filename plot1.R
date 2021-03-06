powerfile <- "./household_power_consumption.txt"
alldata <- read.csv(powerfile, header=TRUE, sep=';', na.strings="?", check.names=FALSE, stringsAsFactors=FALSE, quote='\"')
alldata$Date <- as.Date(alldata$Date, format="%d/%m/%Y")
powerdata <- subset(alldata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(alldata)
datetime <- paste(as.Date(powerdata$Date), powerdata$Time)
powerdata$Datetime <- as.POSIXct(datetime)

hist(powerdata$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

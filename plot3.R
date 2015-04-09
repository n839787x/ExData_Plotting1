powerfile <- "./household_power_consumption.txt"
alldata <- read.csv(powerfile, header=TRUE, sep=';', na.strings="?", check.names=FALSE, stringsAsFactors=FALSE, quote='\"')
alldata$Date <- as.Date(alldata$Date, format="%d/%m/%Y")
powerdata <- subset(alldata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(alldata)
datetime <- paste(as.Date(powerdata$Date), powerdata$Time)
powerdata$Datetime <- as.POSIXct(datetime)

with(powerdata, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

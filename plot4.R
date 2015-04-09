powerfile <- "./household_power_consumption.txt"
alldata <- read.csv(powerfile, header=TRUE, sep=';', na.strings="?", check.names=FALSE, stringsAsFactors=FALSE, quote='\"')
alldata$Date <- as.Date(alldata$Date, format="%d/%m/%Y")
powerdata <- subset(alldata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(alldata)
datetime <- paste(as.Date(powerdata$Date), powerdata$Time)
powerdata$Datetime <- as.POSIXct(datetime)

par(mfrow=c(2,2), mar=c(4,4,2,2), oma=c(0,0,2,0))
with(powerdata, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global_reactive_power",xlab="datetime")
})
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

# plot3.R
#
# Read data file, note the text file needs to be placed above the current directory
#
fulldata <- read.csv("../household_power_consumption.txt", header=TRUE, dec = ".", sep=";", na.strings = "?", stringsAsFactors = FALSE)
pdata <- fulldata[fulldata$Date %in% c("1/2/2007","2/2/2007"), ]
rm(fulldata)

# Converting dates
datetime <- strptime(paste(pdata$Date, pdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
pdata$Datetime <- as.POSIXct(datetime)

with(pdata, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot#3.png", height=480, width=480)

dev.off()

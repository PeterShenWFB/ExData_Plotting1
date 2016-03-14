# plot4.R
#
# Read data file, note the text file needs to be placed above the current directory
#
fulldata <- read.csv("../household_power_consumption.txt", header=TRUE, dec = ".", sep=";", na.strings = "?", stringsAsFactors = FALSE)
pdata <- fulldata[fulldata$Date %in% c("1/2/2007","2/2/2007"), ]
rm(fulldata)

# Converting dates
datetime <- strptime(paste(pdata$Date, pdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
pdata$Datetime <- as.POSIXct(datetime)

# set plot planes
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(pdata, {
        plot(Global_active_power~Datetime, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        plot(Voltage~Datetime, type="l", 
             ylab="Voltage (volt)", xlab="")
        plot(Sub_metering_1~Datetime, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~Datetime, type="l", 
             ylab="Global Rective Power (kilowatts)",xlab="")
})

dev.copy(png, file="plot#4.png", height=480, width=480)

dev.off()


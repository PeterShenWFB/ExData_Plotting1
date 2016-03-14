# plot2.R
#
# Read data file, note the text file needs to be placed above the current directory
#
fulldata <- read.csv("../household_power_consumption.txt", header=TRUE, dec = ".", sep=";", na.strings = "?", stringsAsFactors = FALSE)
pdata <- fulldata[fulldata$Date %in% c("1/2/2007","2/2/2007"), ]
rm(fulldata)

# Converting dates
datetime <- strptime(paste(pdata$Date, pdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
pdata$Datetime <- as.POSIXct(datetime)

# Plot the diagram and make copy to png
plot(pdata$Global_active_power~pdata$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot#2.png", height=480, width=480)

dev.off()

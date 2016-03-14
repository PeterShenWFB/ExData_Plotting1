# plot1.R
#
# Read data file, note the text file needs to be placed above the current directory
#
fulldata <- read.csv("../household_power_consumption.txt", header=TRUE, dec = ".", sep=";", na.strings = "?", stringsAsFactors = FALSE)
pdata <- fulldata[fulldata$Date %in% c("1/2/2007","2/2/2007"), ]
rm(fulldata)

# Plot histogram
hist(pdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.copy(png, file="plot#1.png", height=480, width=480)

dev.off()


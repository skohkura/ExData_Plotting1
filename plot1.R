library(lubridate)

#read and subset data
data <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=100000)
dates <- dmy(data$Date)
subset <- dates %in% c(as.Date("2007-02-01"), as.Date("2007-02-02"))
data <- data[subset,]
rm(dates, subset)

#plot histogram
hist(data$Global_active_power, breaks=12, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

#save plot to png file
dev.copy(png, file = "plot1.png")
dev.off()
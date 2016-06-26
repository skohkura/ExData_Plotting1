library(dplyr)

#read and subset data
data <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=100000)
data <- mutate(data, datetime = as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")))
data <- filter(data, datetime >= as.POSIXct("2007-02-01") & datetime < as.POSIXct("2007-02-03"))

#make plots
par(mfrow = c(2, 2))

#plot 1
with(data, plot(datetime, Global_active_power, type='l', xlab="", ylab="Global Active Power (kilowatts)"))

#plot 2
with(data, plot(datetime, Voltage, type='l'))

#plot 3
with(data, plot(datetime, Sub_metering_1, type='n', xlab="", ylab="Energy sub metering"))
with(data, lines(datetime, Sub_metering_1))
with(data, lines(datetime, Sub_metering_2, col="red"))
with(data, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", col = c("black", "red", "blue"), 
       lty = c(1,1,1), bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot 4
with(data, plot(datetime, Global_reactive_power, type='l'))

#save plot to png file
dev.copy(png, file = "plot4.png")
dev.off()
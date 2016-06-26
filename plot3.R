library(dplyr)

#read and subset data
data <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=100000)
data <- mutate(data, datetime = as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")))
data <- filter(data, datetime >= as.POSIXct("2007-02-01") & datetime < as.POSIXct("2007-02-03"))

#make line graph
with(data, plot(datetime, Sub_metering_1, type='n', xlab="", ylab="Energy sub metering"))
with(data, lines(datetime, Sub_metering_1))
with(data, lines(datetime, Sub_metering_2, col="red"))
with(data, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", col = c("black", "red", "blue"), 
       lty = c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#save plot to png file
dev.copy(png, file = "plot3.png")
dev.off()
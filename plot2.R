library(dplyr)

#read and subset data
data <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=100000)
data <- mutate(data, datetime = as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")))
data <- filter(data, datetime >= as.POSIXct("2007-02-01") & datetime < as.POSIXct("2007-02-03"))

#make line graph
with(data, plot(datetime, Global_active_power, type='l', xlab="", ylab="Global Active Power (kilowatts)"))

#save plot to png file
dev.copy(png, file = "plot2.png")
dev.off()
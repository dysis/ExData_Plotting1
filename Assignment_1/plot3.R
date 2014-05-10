#Assignment 1

#Plot 3
## Thanks to this post for info on legends: http://learningrbasic.blogspot.sg/2009/07/adding-legend-to-plot.html
## Thanks to this post for info on the PNG drawing: https://class.coursera.org/exdata-002/forum/thread?thread_id=147

household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", header = TRUE)
data <- household_power_consumption
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
dataShort <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")
days <- strptime(paste(dataShort$Date, dataShort$Time), format='%Y-%m-%d %H:%M:%S')
png(filename = "plot3.png", width = 480, height = 480)
plot(days, as.numeric(as.character(dataShort$Sub_metering_1)), type="l", ylab="Energy sub metering", xlab="")
lines(days, as.numeric(as.character(dataShort$Sub_metering_2)), type = "l", col = "red")
lines(days, as.numeric(as.character(dataShort$Sub_metering_3)), type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col = c("black", "red", "blue"))
dev.off()
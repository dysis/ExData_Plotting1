#Assignment 1

#Plot 4
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", as.is = TRUE, header = TRUE)
data <- household_power_consumption
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
dataShort <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")
days <- strptime(paste(dataShort$Date, dataShort$Time), format='%Y-%m-%d %H:%M:%S')
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c (2, 2))  
with (dataShort, {
    plot(days, dataShort$Global_active_power, type="l", ylab="Global Active Power", xlab="")
    plot(days, dataShort$Voltage, type="l", ylab="Voltage", xlab="datetime")
    plot(days, dataShort$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
    lines(days, dataShort$Sub_metering_2, type = "l", col = "red")
    lines(days, dataShort$Sub_metering_3, type = "l", col = "blue")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col = c("black", "red", "blue"), bty = "n")
    plot(days, dataShort$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
})
dev.off()
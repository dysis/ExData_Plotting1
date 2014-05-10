#Assignment 1

#Plot 2 - With help from the discussion board and the strptime() help file examples
## read in date/time info in format 'm/d/y h:m:s'
## dates <- c("02/27/92", "02/27/92", "01/14/92", "02/28/92", "02/01/92")
## times <- c("23:03:20", "22:29:56", "01:03:30", "18:21:03", "16:56:26")
## x <- paste(dates, times)
## strptime(x, "%m/%d/%y %H:%M:%S")

household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", as.is = TRUE, header = TRUE)
data <- household_power_consumption
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
dataShort <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")
days <- strptime(paste(dataShort$Date, dataShort$Time), format='%Y-%m-%d %H:%M:%S')
plot(days, dataShort$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file = "plot2.png")
dev.off()

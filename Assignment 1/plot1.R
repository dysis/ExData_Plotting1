#Assignment 1

#Plot 1

household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", header = TRUE)
data <- household_power_consumption
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
dataShort <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")
hist(as.numeric(as.character(dataShort$Global_active_power)), xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()

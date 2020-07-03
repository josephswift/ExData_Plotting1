library(readr)
library(dplyr)

windows(480, 480)

data <- read_delim("./household_power_consumption.txt", delim = ";", col_names = TRUE, na = "?")

dataToAnalyze <- filter(data, as.Date.character(data$Date, "%d/%m/%Y") == "2007-02-01" | as.Date.character(data$Date, "%d/%m/%Y") == "2007-02-02")

dataToAnalyze <- mutate(dataToAnalyze, dateTime = as.POSIXct(strptime(paste(dataToAnalyze$Date, dataToAnalyze$Time), "%d/%m/%Y %H:%M:%S")))

par(mfrow = c(2,2))

plot(dataToAnalyze$dateTime, dataToAnalyze$Global_active_power, type = "l", main = "", ylab = "Global Active Power (kilowatts)", xlab = "")

plot(dataToAnalyze$dateTime, dataToAnalyze$Voltage, type = "l", main = "", xlab="datetime", ylab = "Voltage")

plot(dataToAnalyze$dateTime, dataToAnalyze$Sub_metering_1, type = "l", main = "", ylab = "Energy sub metering", xlab = "")
points(dataToAnalyze$dateTime, dataToAnalyze$Sub_metering_2, type = "l", col = "red")
points(dataToAnalyze$dateTime, dataToAnalyze$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, lwd = 1, pch = c(NA,NA,NA), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(dataToAnalyze$dateTime, dataToAnalyze$Global_reactive_power, type = "l", main = "", xlab="datetime", ylab = "Global_reactive_power")


dev.copy(device = png, file = "./figure/plot4.png")

dev.off()


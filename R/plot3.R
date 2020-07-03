library(readr)
library(dplyr)

windows(480, 480)

data <- read_delim("./household_power_consumption.txt", delim = ";", col_names = TRUE, na = "?")

dataToAnalyze <- filter(data, as.Date.character(data$Date, "%d/%m/%Y") == "2007-02-01" | as.Date.character(data$Date, "%d/%m/%Y") == "2007-02-02")

dataToAnalyze <- mutate(dataToAnalyze, dateTime = as.POSIXct(strptime(paste(dataToAnalyze$Date, dataToAnalyze$Time), "%d/%m/%Y %H:%M:%S")))

plot(dataToAnalyze$dateTime, dataToAnalyze$Sub_metering_1, type = "l", main = "", ylab = "Energy sub metering", xlab = "")
points(dataToAnalyze$dateTime, dataToAnalyze$Sub_metering_2, type = "l", col = "red")
points(dataToAnalyze$dateTime, dataToAnalyze$Sub_metering_3, type = "l", col = "blue")

#scale legend text to fit the labels
legend("topright", lty = 1, lwd = 1, pch = c(NA,NA,NA), col = c("black", "red", "blue"), cex = .75, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(device = png, file = "./figure/plot3.png")

dev.off()


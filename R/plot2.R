library(readr)
library(dplyr)

windows(480, 480)

data <- read_delim("./household_power_consumption.txt", delim = ";", col_names = TRUE, na = "?")

dataToAnalyze <- filter(data, as.Date.character(data$Date, "%d/%m/%Y") == "2007-02-01" | as.Date.character(data$Date, "%d/%m/%Y") == "2007-02-02")

dataToAnalyze <- mutate(dataToAnalyze, dateTime = as.POSIXct(strptime(paste(dataToAnalyze$Date, dataToAnalyze$Time), "%d/%m/%Y %H:%M:%S")))

plot(dataToAnalyze$dateTime, dataToAnalyze$Global_active_power, type = "l", main = "", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(device = png, file = "./figure/plot2.png")
dev.off()


library(readr)
library(dplyr)

windows(480, 480)

data <- read_delim("./household_power_consumption.txt", delim = ";", col_names = TRUE, na = "?")

dataToAnalyze <- filter(data, as.Date.character(data$Date, "%d/%m/%Y") == "2007-02-01" | as.Date.character(data$Date, "%d/%m/%Y") == "2007-02-02")


hist(dataToAnalyze$Global_active_power, col = 'red', main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.copy(device = png, file = "./figure/plot1.png")
dev.off()


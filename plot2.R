household <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# Coerce 'Date' to date format

library(dplyr)
household <- mutate(household, Date = as.Date(household$Date, format = "%d/%m/%Y"))

# Use only data from Feb 1-2, 2007

data <- subset(household, household$Date == "2007-02-01" | household$Date == "2007-02-02")

# Combine 'Date' and 'Time' into 'DateTime' variable

data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, format = "%Y-%m-%d %H:%M:%S")

# Print line plot "plot2" to png file

png(file = "plot2.png")
with(data, plot(DateTime, Global_active_power, type = "n"))
lines(data$DateTime, data$Global_active_power)
dev.off()